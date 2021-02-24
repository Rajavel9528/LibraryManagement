using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class Home : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        CommonClass objCom = new CommonClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Loginun"] != null && Session["Loginun"] != string.Empty &&
                Session["Role"] != null && Session["Role"] != string.Empty)
            {
                BindBooks();
                BindUser();
            }
            else
            {
                Response.Redirect("~/Login.aspx", false);
                return;
            }
        }
        private void BindBooks()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = objDb.FetchBookDetails(0, string.Empty, string.Empty, string.Empty, 0);
                if (dt != null && dt.Rows.Count > 0)
                {
                    gvBook.DataSource = dt;
                    gvBook.DataBind();
                }
                else
                {
                    DataTable emptydt = new DataTable();
                    gvBook.DataSource = dt;
                    gvBook.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void BindUser()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = objDb.GetUserDetails(0,  0);
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
    }
}