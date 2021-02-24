using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Modules
{
    public partial class GetBook : System.Web.UI.Page
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
                BindBooks();
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
                dt = objDb.FetchBookDetails(0, txtpib.Text, txtBook.Text, txtauthorname.Text,
                   Convert.ToInt16(ddlcat.SelectedValue.ToString()));
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewRow row = ((GridViewRow)((LinkButton)sender).NamingContainer);
                int index = row.RowIndex;
                string strBookCode = gvBook.DataKeys[row.RowIndex].Values[0].ToString();
                Response.Redirect("/Modules/NewBook.aspx?BookId=" + HttpUtility.UrlEncode((strBookCode.Trim())) + "", false);
            }
            catch (Exception ex)
            {
            }
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            try
            {
                BindBooks();
            }
            catch (Exception)
            {

            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                ddlcat.SelectedIndex = 0;
                txtauthorname.Text = string.Empty;
                txtBook.Text = string.Empty;
                txtpib.Text = string.Empty;
                BindBooks();
            }
            catch (Exception)
            {
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Modules/NewBook.aspx", false);
            }
            catch (Exception)
            {
            }
        }

        protected void btnget_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["Loginuid"] != null && Session["Loginuid"].ToString() != string.Empty)
                {
                    GridViewRow row = ((GridViewRow)((LinkButton)sender).NamingContainer);
                    int index = row.RowIndex;
                    string LendStatus = gvBook.DataKeys[row.RowIndex].Values[1].ToString();
                    string strBookCode = gvBook.DataKeys[row.RowIndex].Values[0].ToString();
                    if (LendStatus == "1")
                    {
                        //Response.Redirect("/Modules/NewBook.aspx?BookId=" + HttpUtility.UrlEncode((strBookCode.Trim())) + "", false);
                        objDb.LendBook(Convert.ToInt16(strBookCode), Convert.ToInt16(Session["Loginuid"].ToString()));
                        ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alertMessage('Selected Book Added');", true);
                        BindBooks();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Selected Book Not Available');", true);
                    }
                }
            }
            catch (Exception)
            {
              
            }
        }
    }
}