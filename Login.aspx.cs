﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class Login : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        CommonClass objCom = new CommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            try
            {
                
                DataTable dt = new DataTable();
                dt = objDb.CheckUser(txtun.Value,txtpwd.Value);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["VALID"] != null && dt.Rows[0]["VALID"].ToString() != string.Empty)
                    {
                        if (dt.Rows[0]["VALID"].ToString() == "1")
                        {
                            if (dt.Rows[0]["User_Role"] != null && dt.Rows[0]["User_Role"].ToString() != string.Empty)
                            {
                                Session["Role"] = dt.Rows[0]["User_Role"].ToString();
                                Session["Loginun"] = txtun.Value;
                                Session["Loginuid"] = dt.Rows[0]["UserID"].ToString();
                                Response.Redirect("~/Home.aspx", false);
                            }
                        }
                        else
                        {
                            Session["Role"] = string.Empty;
                            Session["Loginun"] = string.Empty;
                            Session["Loginuid"] = string.Empty;
                            ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Invalid Login');", true);
                        }
                    }
                }
                else
                {
                    Session["Role"] = string.Empty;
                    Session["Loginun"] = string.Empty;
                    Session["Loginuid"] = string.Empty;
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Invalid Login');", true);

                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}