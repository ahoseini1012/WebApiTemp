using System.Text;
using LicenseServer.DL.Authentication;
using LicenseServer.Models.Authentication;
using LicenseServer.Models.DB;
using LicenseServer.Utilities;
using Newtonsoft.Json;


namespace LicenseServer.BL.Authentication
{
    public interface IProject_BL
    {
        Task<Project?> GetProjectDetail(string data,string iPAddress);
    }

    public class Project_BL : IProject_BL
    {
        private IProject_DL _db;

        public Project_BL(IProject_DL db)
        {
            _db = db;
        }

        public async Task<Project?> GetProjectDetail(string encripted,string iPAddress)
        {
            try
            {
                string[] dataArr = encripted.Split("#");
                var projectId = Convert.ToInt32(dataArr[0]);
                var data = dataArr[1];

                // 1: export project details from encripted data
                Encription encription = new Encription();
                var dataByte = Convert.FromBase64String(data);
                var csp = encription.ImportPrivateKey();
                var dataDecryptedByte = csp.Decrypt(dataByte, false);
                var claimedStr = System.Text.Encoding.Unicode.GetString(dataDecryptedByte);
                var project_claim = JsonConvert.DeserializeObject<Project>(claimedStr);

                if (project_claim == null)
                    throw new Exception("مخشصات پروژه ارسال شود");
                if (project_claim!.id == null)
                    throw new Exception("شناسه پروژه ارسال گردد");

                // 2: get project details from database
                var project_db = await _db.GetProject(projectId);
                if (project_db.Result == null)
                {
                    throw new Exception("موردی یافت نشد");
                }

                // compare 1 and 2
                if (project_claim.id == project_db.Result.id && project_claim.macAddress == project_db.Result.macAddress && iPAddress == project_db.Result.ipAddress)
                {
                    return project_db.Result;
                }
                else
                {
                    return null;
                }
            }
            catch (System.Exception ex)
            {
                System.Console.WriteLine(ex.Message);
                throw;
            }
        }
    }
}