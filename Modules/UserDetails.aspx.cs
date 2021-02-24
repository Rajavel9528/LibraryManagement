using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Modules
{
    public partial class UserDetails : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        CommonClass objCom = new CommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Loginun"] != null && Session["Loginun"] != string.Empty &&
             Session["Role"] != null && Session["Role"] != string.Empty)
            {
                if (Session["Role"].ToString() == "2")
                {
                    btnCreate.Visible = false;
                }
                else
                {
                    btnCreate.Visible = true;
                }
                BindUsers();
            }
            else
            {
                Response.Redirect("/Login.aspx", false);
                return;
            }
        }
        private void BindUsers()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = objDb.GetUserDetails(0,1);
                if (dt != null && dt.Rows.Count > 0)
                {
                    gvUSer.DataSource = dt;
                    gvUSer.DataBind();
                }
                else
                {
                    DataTable emptydt = new DataTable();
                    gvUSer.DataSource = dt;
                    gvUSer.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                 Response.Redirect("~/Modules/Users.aspx", false);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = ((GridViewRow)((LinkButton)sender).NamingContainer);
                int index = row.RowIndex;
                string strBookCode = gvUSer.DataKeys[row.RowIndex].Values[0].ToString();
                Response.Redirect("/Modules/Users.aspx?UserId=" + HttpUtility.UrlEncode((strBookCode.Trim())) + "", false);
 
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}