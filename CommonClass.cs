using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Xml;

namespace LibraryManagement
{
     public class CommonClass
    {
        /// <summary>
        /// 
        /// </summary>
        public SqlConnection con = new SqlConnection();

        /// <summary>
        /// 
        /// </summary>
        public SqlCommand cmd = new SqlCommand();

        /// <summary>
        /// 
        /// </summary>
        private SqlDataReader dr;

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public SqlConnection NewConnection()
        {
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["con_string"].ConnectionString;
                    con.Open();
                }
                return con;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        //public void message(string msg, page page1)
        //{
        //    string orginalmsg = msg;
        //    string clearmsg = orginalmsg.replace("'", "");
        //    clearmsg = clearmsg.replace("\r", " ");
        //    clearmsg = clearmsg.replace("\n", " ");
        //    clearmsg = clearmsg.replace("\r\n", " ");

        //    scriptmanager.registerstartupscript(page1, typeof(system.web.ui.page), "", "alert('" + clearmsg + "');pageload('dct')", true);
        //}
        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public DataTable SpDtTbl(string str, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = str;
                cmd.Connection = NewConnection();

                SqlDataAdapter data_adp = new SqlDataAdapter(cmd);
                DataTable dttable = new DataTable();
                data_adp.Fill(dttable);

                return dttable;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public DataSet SpDsTbl(string str, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = str;
                cmd.Connection = NewConnection();

                SqlDataAdapter data_adp = new SqlDataAdapter(cmd);
                DataSet dstable = new DataSet();
                data_adp.Fill(dstable);
                return dstable;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        public DataTable ConvertXmlStringToDataSet(String xmlData)
        {
            StringReader theReader = new StringReader(xmlData);
            DataSet theDataSet = new DataSet();
            theDataSet.ReadXml(theReader);

            return theDataSet.Tables[0];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="qry"></param>
        public void ExecuteNonQuery(string qry)
        {
            try
            {
                NewConnection();
                SqlCommand cmd = new SqlCommand(qry, con);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// Execute Query
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">Commanf object</param>
        /// <returns>1,0,-1</returns>
        public int ExecuteQuery(string spName, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                int res = cmd.ExecuteNonQuery();
                return res;
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// Execute Query and returns integer output
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">sql command</param>
        /// <param name="returnParameterName">return parameter name</param>
        /// <returns>output value</returns>
        public int ExecuteQueryInt(string spName, SqlCommand cmd, string returnParameterName = "Newno")
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                cmd.ExecuteNonQuery();
                return Convert.ToInt32(cmd.Parameters["@" + returnParameterName].Value.ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// Execute Query and returns long output
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">sql command</param>
        /// <param name="returnParameterName">return parameter name</param>
        /// <returns>output value</returns>
        public long ExecuteQueryLong(string spName, SqlCommand cmd, string returnParameterName = "NewCode")
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                cmd.ExecuteNonQuery();
                return Convert.ToInt64(cmd.Parameters["@" + returnParameterName].Value.ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// Execute Query and returns decimal output
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">sql command</param>
        /// <param name="returnParameterName">return parameter name</param>
        /// <returns>output value</returns>
        public decimal ExecuteQueryDecimal(string spName, SqlCommand cmd, string returnParameterName = "NewCode")
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                cmd.ExecuteNonQuery();
                return Convert.ToDecimal(cmd.Parameters["@" + returnParameterName].Value.ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// Execute Query and returns double output
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">sql command</param>
        /// <param name="returnParameterName">return parameter name</param>
        /// <returns>output value</returns>
        public double ExecuteQueryDouble(string spName, SqlCommand cmd, string returnParameterName = "NewCode")
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                cmd.ExecuteNonQuery();
                return Convert.ToDouble(cmd.Parameters["@" + returnParameterName].Value.ToString());
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// Execute Query and returns string output
        /// </summary>
        /// <param name="spName">Sp Name</param>
        /// <param name="cmd">sql command</param>
        /// <param name="returnParameterName">return parameter name</param>
        /// <returns>output value</returns>
        public string ExecuteQueryString(string spName, SqlCommand cmd, string returnParameterName = "NewCode")
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                cmd.ExecuteNonQuery();
                return cmd.Parameters["@" + returnParameterName].Value.ToString();
            }
            catch (Exception ex)
            {
                return "";
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="strQry"></param>
        /// <returns></returns>
        public int ReturnExeNonQuery(string strQry)
        {
            try
            {
                int intCnt = 0;
                NewConnection();
                SqlCommand cmd = new SqlCommand(strQry, con);
                intCnt = cmd.ExecuteNonQuery();
                return intCnt;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// This function will close the sql command connection
        /// </summary>
        /// <param name="sqlCommand">SqlCommand to close</param>
        public void CloseSqlCommand(SqlCommand sqlCommand, SqlConnection sqlConnection)
        {
            try
            {
                if (sqlCommand != null)
                {
                    if (sqlCommand.Connection != null)
                    {
                        sqlCommand.Connection.Close();
                        sqlCommand.Connection.Dispose();
                    }

                    sqlCommand.Dispose();
                }

                if (sqlConnection != null)
                {
                    if (sqlConnection.State != ConnectionState.Closed)
                    {
                        sqlConnection.Close();
                        sqlConnection.Dispose();
                    }
                    sqlConnection.Dispose();
                }
            }
            catch (Exception ex)
            {
            }
        }

        #region CovertToString

        /// <summary>
        /// Method Description :
        /// Revision History :
        /// </summary>
        /// <param name="Dt"></param>
        /// <returns></returns>
        public string ConvertDtToString(DataTable Dt)
        {
            try
            {
                DataSet Ds = new DataSet();
                Ds.Tables.Add(Dt);
                StringWriter stWriter = new StringWriter();
                Ds.WriteXml(stWriter, XmlWriteMode.WriteSchema);
                return stWriter.ToString();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="Dst"></param>
        /// <returns></returns>
        public string ConvertDsToString(DataSet Dst)
        {
            try
            {
                StringWriter stWriter = new StringWriter();
                Dst.WriteXml(stWriter, XmlWriteMode.WriteSchema);
                return stWriter.ToString();
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="spName"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public int ExecuteScalarInt(string spName, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                int intSclr = Convert.ToInt32(cmd.ExecuteScalar());
                return intSclr;
            }
            catch (Exception ex)
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="qry"></param>
        /// <returns></returns>
        public string ExecuteScalar(string qry)
        {
            try
            {
                NewConnection();
                SqlCommand cmd = new SqlCommand(qry, con);
                string Sclr = Convert.ToString(cmd.ExecuteScalar());
                return Sclr;
            }
            catch (Exception ex)
            {
                return null;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="spName"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public string ExecuteScalarString(string spName, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                string Sclr = Convert.ToString(cmd.ExecuteScalar());
                return Sclr;
            }
            catch (Exception ex)
            {
               
                return null;
            }
            finally
            {

                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="spName"></param>
        /// <param name="cmd"></param>
        /// <returns></returns>
        public bool ExecuteScalarBool(string spName, SqlCommand cmd)
        {
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = spName;
                cmd.Connection = NewConnection();
                bool Sclr = Convert.ToBoolean(cmd.ExecuteScalar());
                return Sclr;
            }
            catch (Exception ex)
            {
                return false;
            }
            finally
            {
                CloseSqlCommand(cmd, con);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="dtBuildSQL"></param>
        /// <param name="dtName"></param>
        /// <returns></returns>
        public string ConvertDataTablesToXML(DataTable dtBuildSQL, string dtName)
        {
            try
            {

                DataSet dsBuildSQL = new DataSet();
                StringBuilder sbSQL;
                StringWriter swSQL;
                string XMLformat;

                sbSQL = new StringBuilder();
                swSQL = new StringWriter(sbSQL);
                dsBuildSQL.Merge(dtBuildSQL, true, MissingSchemaAction.AddWithKey);
                dsBuildSQL.Tables[0].TableName = dtName;
                foreach (DataColumn col in dsBuildSQL.Tables[0].Columns)
                {
                    col.ColumnMapping = MappingType.Attribute;
                }
                dsBuildSQL.WriteXml(swSQL, XmlWriteMode.WriteSchema);
                XMLformat = sbSQL.ToString();
                return XMLformat;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        #endregion CovertToString

        /// <summary>
        /// 
        /// </summary>
        /// <param name="Dt"></param>
        /// <returns></returns>
        public XmlElement CovertDtToString(DataTable Dt)
        {
            try
            {
                XmlDocument doc = new XmlDocument();
                System.IO.StringWriter writer = new System.IO.StringWriter();
                DataSet Ds = new DataSet();
                Ds.Tables.Add(Dt);
                Ds.WriteXml(writer, XmlWriteMode.WriteSchema);
                doc.LoadXml(writer.ToString());
                doc.Save(writer);
                return doc.DocumentElement;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public string ConvertDataTableToXML(DataTable dtBuildSQL)
        {
            DataSet dsBuildSQL = new DataSet();
            StringBuilder sbSQL;
            StringWriter swSQL;
            string XMLformat;

            sbSQL = new StringBuilder();
            swSQL = new StringWriter(sbSQL);
            dsBuildSQL.Merge(dtBuildSQL, true, MissingSchemaAction.AddWithKey);
            dsBuildSQL.Tables[0].TableName = "dtDetails";
            foreach (DataColumn col in dsBuildSQL.Tables[0].Columns)
            {
                col.ColumnMapping = MappingType.Attribute;
            }
            dsBuildSQL.WriteXml(swSQL, XmlWriteMode.WriteSchema);
            XMLformat = sbSQL.ToString();
            return XMLformat;
        }
    }
}
