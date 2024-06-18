using Org.BouncyCastle.Crypto;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.OpenSsl;
using Org.BouncyCastle.Security;
using System.Security.Cryptography;
using System.Text;


namespace LicenseServer.BL.Authentication
{
    public class Encription
    {
        public string PemFile2XML(string path)
        {
            using (var reader = File.OpenText(path))
            {
                var pemReader = new PemReader(reader);
                var KeyParam = (RsaKeyParameters)pemReader.ReadObject();
                var rsa = RSA.Create();
                rsa.ImportParameters(new RSAParameters
                {
                    Modulus = KeyParam.Modulus.ToByteArrayUnsigned(),
                    Exponent = KeyParam.Exponent.ToByteArrayUnsigned()
                });

                // Export to XML string
                string xmlPublicKey = rsa.ToXmlString(false);
                return xmlPublicKey;
            }
        }

        public string PemString2XML(string pem)
        {
            var streamReader = new StreamReader(pem);
            var pemReader = new PemReader(streamReader);
            var publicKeyParam = (RsaKeyParameters)pemReader.ReadObject();
            var rsa = RSA.Create();
            rsa.ImportParameters(new RSAParameters
            {
                Modulus = publicKeyParam.Modulus.ToByteArrayUnsigned(),
                Exponent = publicKeyParam.Exponent.ToByteArrayUnsigned()
            });

            // Export to XML string
            string xmlPublicKey = rsa.ToXmlString(false);
            return xmlPublicKey;
        }

        public void KeysGenerator(out RSAParameters privKey, out RSAParameters pubKey)
        {
            //lets take a new CSP with a new 2048 bit rsa key pair
            var csp = new RSACryptoServiceProvider(2048);

            //how to get the private key
            privKey = csp.ExportParameters(true);

            //and the public key ...
            pubKey = csp.ExportParameters(false);
        }

        public string Encrypt(string text, RSAParameters pubKey)
        {
            var csp = new RSACryptoServiceProvider();
            var txtByte = Encoding.Unicode.GetBytes(text);


            csp.ImportParameters(pubKey);
            var bytesCypherText = csp.Encrypt(txtByte, false);
            var cypherText = Convert.ToBase64String(bytesCypherText);
            return cypherText;
        }

        public string Decrypt(string text, RSAParameters privKey)
        {
            var txtByte = Encoding.Unicode.GetBytes(text);
            var csp = new RSACryptoServiceProvider();
            csp.ImportParameters(privKey);
            var bytesPlainTextData = csp.Decrypt(txtByte, false);
            var decrypted = System.Text.Encoding.Unicode.GetString(bytesPlainTextData);
            return decrypted;
        }


        /// <summary>
        /// Import OpenSSH PEM private key string into MS RSACryptoServiceProvider
        /// </summary>
        /// <param name="pem"></param>
        /// <returns></returns>
        public RSACryptoServiceProvider ImportPrivateKey()
        {
            PemReader pr = new PemReader(new StringReader(UP_PrivateKey));
            AsymmetricKeyParameter KeyPair = (AsymmetricKeyParameter)pr.ReadObject();
            RSAParameters rsaParams = DotNetUtilities.ToRSAParameters((RsaPrivateCrtKeyParameters)KeyPair);

            RSACryptoServiceProvider csp = new RSACryptoServiceProvider();// cspParams);
            csp.ImportParameters(rsaParams);
            return csp;
        }

        /// <summary>
        /// Import OpenSSH PEM public key string into MS RSACryptoServiceProvider
        /// </summary>
        /// <param name="pem"></param>
        /// <returns></returns>
        public RSACryptoServiceProvider ImportPublicKey(string pem)
        {
            PemReader pr = new PemReader(new StringReader(pem));
            AsymmetricKeyParameter publicKey = (AsymmetricKeyParameter)pr.ReadObject();
            RSAParameters rsaParams = DotNetUtilities.ToRSAParameters((RsaKeyParameters)publicKey);

            RSACryptoServiceProvider csp = new RSACryptoServiceProvider();// cspParams);
            csp.ImportParameters(rsaParams);
            return csp;
        }


        /// <summary>
        /// Export private (including public) key from MS RSACryptoServiceProvider into OpenSSH PEM string
        /// slightly modified from https://stackoverflow.com/a/23739932/2860309
        /// </summary>
        /// <param name="csp"></param>
        /// <returns></returns>
        public string ExportPrivateKey(RSACryptoServiceProvider csp)
        {
            StringWriter outputStream = new StringWriter();
            if (csp.PublicOnly) throw new ArgumentException("CSP does not contain a private key", "csp");
            var parameters = csp.ExportParameters(true);
            using (var stream = new MemoryStream())
            {
                var writer = new BinaryWriter(stream);
                writer.Write((byte)0x30); // SEQUENCE
                using (var innerStream = new MemoryStream())
                {
                    var innerWriter = new BinaryWriter(innerStream);
                    EncodeIntegerBigEndian(innerWriter, new byte[] { 0x00 }); // Version
                    EncodeIntegerBigEndian(innerWriter, parameters.Modulus!);
                    EncodeIntegerBigEndian(innerWriter, parameters.Exponent!);
                    EncodeIntegerBigEndian(innerWriter, parameters.D!);
                    EncodeIntegerBigEndian(innerWriter, parameters.P!);
                    EncodeIntegerBigEndian(innerWriter, parameters.Q!);
                    EncodeIntegerBigEndian(innerWriter, parameters.DP!);
                    EncodeIntegerBigEndian(innerWriter, parameters.DQ!);
                    EncodeIntegerBigEndian(innerWriter, parameters.InverseQ!);
                    var length = (int)innerStream.Length;
                    EncodeLength(writer, length);
                    writer.Write(innerStream.GetBuffer(), 0, length);
                }

                var base64 = Convert.ToBase64String(stream.GetBuffer(), 0, (int)stream.Length).ToCharArray();
                // WriteLine terminates with \r\n, we want only \n
                outputStream.Write("-----BEGIN RSA PRIVATE KEY-----\n");
                // Output as Base64 with lines chopped at 64 characters
                for (var i = 0; i < base64.Length; i += 64)
                {
                    outputStream.Write(base64, i, Math.Min(64, base64.Length - i));
                    outputStream.Write("\n");
                }
                outputStream.Write("-----END RSA PRIVATE KEY-----");
            }

            return outputStream.ToString();
        }


        /// <summary>
        /// Export public key from MS RSACryptoServiceProvider into OpenSSH PEM string
        /// slightly modified from https://stackoverflow.com/a/28407693
        /// </summary>
        /// <param name="csp"></param>
        /// <returns></returns>
        public string ExportPublicKey(RSACryptoServiceProvider csp)
        {
            StringWriter outputStream = new StringWriter();
            var parameters = csp.ExportParameters(false);
            using (var stream = new MemoryStream())
            {
                var writer = new BinaryWriter(stream);
                writer.Write((byte)0x30); // SEQUENCE
                using (var innerStream = new MemoryStream())
                {
                    var innerWriter = new BinaryWriter(innerStream);
                    innerWriter.Write((byte)0x30); // SEQUENCE
                    EncodeLength(innerWriter, 13);
                    innerWriter.Write((byte)0x06); // OBJECT IDENTIFIER
                    var rsaEncryptionOid = new byte[] { 0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x01, 0x01 };
                    EncodeLength(innerWriter, rsaEncryptionOid.Length);
                    innerWriter.Write(rsaEncryptionOid);
                    innerWriter.Write((byte)0x05); // NULL
                    EncodeLength(innerWriter, 0);
                    innerWriter.Write((byte)0x03); // BIT STRING
                    using (var bitStringStream = new MemoryStream())
                    {
                        var bitStringWriter = new BinaryWriter(bitStringStream);
                        bitStringWriter.Write((byte)0x00); // # of unused bits
                        bitStringWriter.Write((byte)0x30); // SEQUENCE
                        using (var paramsStream = new MemoryStream())
                        {
                            var paramsWriter = new BinaryWriter(paramsStream);
                            EncodeIntegerBigEndian(paramsWriter, parameters.Modulus!); // Modulus
                            EncodeIntegerBigEndian(paramsWriter, parameters.Exponent!); // Exponent
                            var paramsLength = (int)paramsStream.Length;
                            EncodeLength(bitStringWriter, paramsLength);
                            bitStringWriter.Write(paramsStream.GetBuffer(), 0, paramsLength);
                        }
                        var bitStringLength = (int)bitStringStream.Length;
                        EncodeLength(innerWriter, bitStringLength);
                        innerWriter.Write(bitStringStream.GetBuffer(), 0, bitStringLength);
                    }
                    var length = (int)innerStream.Length;
                    EncodeLength(writer, length);
                    writer.Write(innerStream.GetBuffer(), 0, length);
                }

                var base64 = Convert.ToBase64String(stream.GetBuffer(), 0, (int)stream.Length).ToCharArray();
                // WriteLine terminates with \r\n, we want only \n
                outputStream.Write("-----BEGIN PUBLIC KEY-----\n");
                for (var i = 0; i < base64.Length; i += 64)
                {
                    outputStream.Write(base64, i, Math.Min(64, base64.Length - i));
                    outputStream.Write("\n");
                }
                outputStream.Write("-----END PUBLIC KEY-----");
            }

            return outputStream.ToString();
        }


        /// <summary>
        /// https://stackoverflow.com/a/23739932/2860309
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="length"></param>
        private void EncodeLength(BinaryWriter stream, int length)
        {
            if (length < 0) throw new ArgumentOutOfRangeException("length", "Length must be non-negative");
            if (length < 0x80)
            {
                // Short form
                stream.Write((byte)length);
            }
            else
            {
                // Long form
                var temp = length;
                var bytesRequired = 0;
                while (temp > 0)
                {
                    temp >>= 8;
                    bytesRequired++;
                }
                stream.Write((byte)(bytesRequired | 0x80));
                for (var i = bytesRequired - 1; i >= 0; i--)
                {
                    stream.Write((byte)(length >> (8 * i) & 0xff));
                }
            }
        }


        /// <summary>
        /// https://stackoverflow.com/a/23739932/2860309
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="value"></param>
        /// <param name="forceUnsigned"></param>
        private void EncodeIntegerBigEndian(BinaryWriter stream, byte[] value, bool forceUnsigned = true)
        {
            stream.Write((byte)0x02); // INTEGER
            var prefixZeros = 0;
            for (var i = 0; i < value.Length; i++)
            {
                if (value[i] != 0) break;
                prefixZeros++;
            }
            if (value.Length - prefixZeros == 0)
            {
                EncodeLength(stream, 1);
                stream.Write((byte)0);
            }
            else
            {
                if (forceUnsigned && value[prefixZeros] > 0x7f)
                {
                    // Add a prefix zero to force unsigned if the MSB is 1
                    EncodeLength(stream, value.Length - prefixZeros + 1);
                    stream.Write((byte)0);
                }
                else
                {
                    EncodeLength(stream, value.Length - prefixZeros);
                }
                for (var i = prefixZeros; i < value.Length; i++)
                {
                    stream.Write(value[i]);
                }
            }
        }


        private const string UP_PublicKey = @"-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyVNg2xY0mmSYz58V+MQK
zRQYTni+U27NpD4GBTAYutQzQx5yNAYpU2QRosh4AduPqTHIHgr5KVr6/y4uXI1E
s+qhRRBNDxrYidLVBaCelJgfnuBaKeiULUmPZYhHTYYIbyM8Ve2IRudkU7SCJPuz
9ABgWLu+5NeqzrApcjAFjviWSOL1U6c6YB3eIWV8iptfIx+Ebsb9TqeBQkTjpKqe
jmAmmzn/8XFZ5g7+WMKjrTWyc5H5GVVJmWfmSzGiikdGe9mBXpWXFkYziWIHcrGp
oXUVc3Q64gaQC5Sr0N6KU+Byz4D7cPGvAXoj++eeZl14GD/I+QRfZYiDb5D+wFSC
pQIDAQAB
-----END PUBLIC KEY-----";


        private const string UP_PrivateKey = @"-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDJU2DbFjSaZJjP
nxX4xArNFBhOeL5Tbs2kPgYFMBi61DNDHnI0BilTZBGiyHgB24+pMcgeCvkpWvr/
Li5cjUSz6qFFEE0PGtiJ0tUFoJ6UmB+e4Fop6JQtSY9liEdNhghvIzxV7YhG52RT
tIIk+7P0AGBYu77k16rOsClyMAWO+JZI4vVTpzpgHd4hZXyKm18jH4Ruxv1Op4FC
ROOkqp6OYCabOf/xcVnmDv5YwqOtNbJzkfkZVUmZZ+ZLMaKKR0Z72YFelZcWRjOJ
YgdysamhdRVzdDriBpALlKvQ3opT4HLPgPtw8a8BeiP7555mXXgYP8j5BF9liINv
kP7AVIKlAgMBAAECggEAEK3ZMN1qlz3tUQofgmAPewUGrH2hWv0riUdgLU7aRaQt
6QodMQUvqEp6kY9lLdY4VS6cIy0KjmwMrlZvndhQUE2IddXPZIh3VxfB8Tjo2mut
9vYkUiOEHypgeGttaNVJXpe/OGk46JLkA3FJdPHrazQax08qlf/uFTiP/ndPBpSZ
E38tC1fCJ9pmNjvilRxh/9nr1PPOAmPSFBx8w/X9ivVJgKAaD+aJqP7Vs6X6kffG
f3OV8aKNNVYjFUmgcZHVzOU/gF9bObNrankxCFF3/b7mck2qjWyf/mZfBzUW5iRo
pXv4P0HAiWp4gjtxeBfweAXRwxN23jGP43NXe16ZQQKBgQDm/Kti8xL5LBQOph+H
azjSj9kcR4Rx5+T3hhb7gqDF7nMUJyXJHarnQa0dEePbVOiHmI/cKs4j5sMwacEA
09OTwc4e1EP6pD1dNoQbM9st25rIJeGn1VxX9GuDLY3ocrVOCGHsa/+GZo6VNDJy
mOcNi6Y72gFIfTzIgQSrZWDjRQKBgQDfIHM86tTrtyLF83QgN71OrhtlxzudhXZk
fWt3eIvclnT7uzkfpyqvfMbXkJSbCVUvOtARgtaB/7eS/kkoCIbS0yxM5JH9Ve0n
nXPuA1u23XTTk32NaSod69AYmnH8X2vX26BDCdl8Q71gxqAh/mKEGzDdfjJoL68Y
N5iQbYxn4QKBgC4EKCCOTDlXjqdccOuJcMiB377CgKAwkmy9SdbRLzY/Sq25Hs3y
Gxn2+4XPCpWnVKuuuPojjO2aC0iZyNlhWcUV1vpNTz2fepoXQjopGoEIPs2gvlOx
LbRX/RMlACBOuc/R27A906nyxHT08RfjXiRUrck+pQLL8FABY+zBRYwBAoGAYSnl
ZOKyQ89lQiRpLlp3gprI7YJcEJV83/fJ46XH6hBO8wwtrP4D1ZWVlWutevIOeVm4
H9gFB2lPDKDVRKyp4Yb6JKXoeRSBCJ5FTKGDv9ciN7xjkT/5ijwVS5F+D7OR59cJ
LAhPABETl+AG/aakSfj5R4rb8ojJS9dyBXrfCKECgYATpLnarE0Y71ZRnZjoU7cV
WVvnlFJ2cfVlctroWOtoQItoGZS0INnat2lTlaDhCD29JReYa+jW3sw/bpWBoApk
UBQFo4YuZWGJi1AOYYkIRZIJyj1G/ycmRt3F7M0/vi8U29HLOjDhzEmCab7GR2I+
xs/09ya+vXWvZ4xp5IgZ/A==
-----END PRIVATE KEY-----";

    }

}