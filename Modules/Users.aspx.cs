using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Modules
{
    public partial class Users : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        CommonClass objCom = new CommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Loginun"] != null && Session["Loginun"] != string.Empty &&
             Session["Role"] != null && Session["Role"] != string.Empty)
            {
                if(Session["Role"].ToString() == "2")
                {
                    btnDelete.Visible = false;
                    btnsubmit.Visible = false;
                    btnupdate.Visible = false;
                }
                else
                {
                    btnDelete.Visible = true;
                    btnsubmit.Visible = true;
                    btnupdate.Visible = true;
                }
                if (Request.QueryString["UserId"] != null && Request.QueryString["UserId"].ToString() != string.Empty)
                {
                    UserId.Value = HttpUtility.UrlDecode(Request.QueryString["UserId"].ToString()).ToString();
                    BindUserDetails();
                }
            }
            else
            {
                Response.Redirect("/Login.aspx", false);
                return;
            }
        }
        private void setVisibility(int intStatus)
        {
            try
            {
                if (intStatus == 1)
                {
                    btnDelete.Enabled = true;
                    btnupdate.Enabled = true;
                    btnsubmit.Enabled = false;

                }
                else if (intStatus == 3)
                {
                    btnDelete.Enabled = false;
                    btnupdate.Enabled = false;
                    btnsubmit.Enabled = false;
                }
                else
                {
                    btnDelete.Enabled = false;
                    btnupdate.Enabled = false;
                    btnsubmit.Enabled = true;
                }

            }
            catch (Exception)
            {

            }
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int UserID = objDb.UserCrud(txtusername.Value, txtpwd.Value, Convert.ToInt16(ddlUserRole.Value.ToString())
                        , 1, 0);
                    if (UserID > 0)
                    {
                        UserId.Value = UserID.ToString();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('New User Created Successfully');", true);
                        BindUserDetails();
                    }
                    else if (UserID == -3)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('User Name already exist');", true);
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        private void BindUserDetails()
        {
            try
            {
                DataTable dt = new DataTable();
                int status = 0;
                if (!string.IsNullOrEmpty(UserId.Value))
                {
                    dt = objDb.GetUserDetails(Convert.ToInt32(UserId.Value == string.Empty ? 0 :
                        Convert.ToInt32(UserId.Value)),0);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtusername.Value = dt.Rows[0]["USER_NAME"].ToString();
                        txtpwd.Value = dt.Rows[0]["User_Password"].ToString();
                        ddlUserRole.Value = dt.Rows[0]["LOGINROLE"].ToString();
                        status = Convert.ToInt16(dt.Rows[0]["Status"].ToString());
                        setVisibility(status);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (Page.IsValid)
                {
                    int UserID = objDb.UserCrud(txtusername.Value, txtpwd.Value, Convert.ToInt16(ddlUserRole.Value.ToString())
                        , 2, Convert.ToInt32(UserId.Value == string.Empty ? 0 : Convert.ToInt32(UserId.Value)));
                    if (UserID > 0)
                    {
                        UserId.Value = UserID.ToString();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('User Updated Successfully');", true);
                        BindUserDetails();
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                 if (Page.IsValid)
                {
                    int UserID = objDb.UserCrud(txtusername.Value, txtpwd.Value, Convert.ToInt16(ddlUserRole.Value.ToString())
                        , 3, Convert.ToInt32(UserId.Value == string.Empty ? 0 : Convert.ToInt32(UserId.Value)));
                    if (UserID > 0)
                    {
                        UserId.Value = UserID.ToString();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('User Deleted Successfully');", true);
                        Response.Redirect("~/Modules/UserDetails.aspx", false);
                        return;
                    }
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}