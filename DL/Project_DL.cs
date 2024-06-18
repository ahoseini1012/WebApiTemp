using System.Data;
using Dapper;
using LicenseServer.DL.Authentication;
using LicenseServer.Models.Authentication;
using LicenseServer.Models.DB;
using LicenseServer.Utilities;


namespace LicenseServer.DL.Authentication
{
    public interface IProject_DL
    {
        Task<int> RegisterProject();
        Task<DBResult<Project>> GetProject(int projectId);
    }

    public class Project_DL:IProject_DL
    {
        private DBContext _db;

        public Project_DL(DBContext dBContext)
        {
            _db=dBContext;
        }

        // get project data
        public async Task<DBResult<Project>> GetProject(int projectId)
        {
            var dbResult = new DBResult<Project>();
            var cnn = _db.CreateConnection();
            var data = new DynamicParameters();
            data.Add("projectId", projectId);
            data.Add("responseCode", dbType: DbType.Int32, direction: ParameterDirection.Output);
            data.Add("responseMessage", dbType: DbType.String, direction: ParameterDirection.Output, size: 250);

            var queryRes = await cnn.QueryAsync<Project>("SP_ProjectGetById", data, commandType: CommandType.StoredProcedure);
            dbResult.responseMessage = data.Get<string>("responseMessage");
            dbResult.responseCode = data.Get<int>("responseCode");
            if (dbResult.responseCode != 500)
            {
                dbResult.Result = queryRes.FirstOrDefault();
            }
            return dbResult;
        }
        
        //insert project data
        public Task<int> RegisterProject()
        {
            throw new NotImplementedException();
        }






    }
}