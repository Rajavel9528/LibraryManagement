using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LibraryManagement;

namespace LibraryManagement.Modules
{
    public partial class Books : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Un"] != null && Session["Un"] != string.Empty)
                {

                }
                else
                {
                    Response.Redirect("~/Login.aspx", false);
                    return;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                
                int BookId = 0;
                
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {

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

            }
            catch (Exception)
            {

                throw;
            }
        }
        private void CrudProcess(int Operation)
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