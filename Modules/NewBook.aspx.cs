using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement.Modules
{
    public partial class NewBook : System.Web.UI.Page
    {
        DBProcess objDb = new DBProcess();
        CommonClass objCom = new CommonClass();
        protected string UploadFolderPath = ConfigurationManager.AppSettings["Upload"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Loginun"] != null && Session["Loginun"] != string.Empty &&
              Session["Role"] != null && Session["Role"] != string.Empty)
                {
                    if (Session["Role"].ToString() == "2")
                    {
                        btnDelete.Visible = false;
                        Submit.Visible = false;
                        btnupdate.Visible = false;
                    }
                    else
                    {
                        btnDelete.Visible = true;
                        Submit.Visible = true;
                        btnupdate.Visible = true;
                    }
                    InitialEvents();
                    Image1.ImageUrl = UploadFolderPath + "NoImage.png";
                }
                else
                {
                    Response.Redirect("~/Login.aspx", false);
                    return;
                }
                if(Request.QueryString["BookId"] != null && Request.QueryString["BookId"].ToString() != string.Empty)
                {
                    txtBookId.Text = HttpUtility.UrlEncode(Request.QueryString["BookId"].ToString()).ToString();
                    BindBookDetails();

                }
            }
        }
        private void setVisibility(int intStatus)
        {
            try
            {
                if(intStatus == 1)
                {
                    btnDelete.Enabled = true;
                    btnupdate.Enabled = true;
                    Submit.Enabled = false;
                    
                }
                else if (intStatus == 3)
                {
                    btnDelete.Enabled = false;
                    btnupdate.Enabled = false;
                    Submit.Enabled = false;
                }
                else
                {
                    btnDelete.Enabled = false;
                    btnupdate.Enabled = false;
                    Submit.Enabled = true;
                }

            }
            catch (Exception)
            {
                
            }
        }
        private void InitialEvents()
        {
            try
            {

                txtBookId.Attributes.Add("onclick", "return requiredFieldValidation();");
                txtBookName.Attributes.Add("onclick", "return requiredFieldValidation();");
                txtAuthorName.Attributes.Add("onclick", "return requiredFieldValidation();");
                txtpublisherName.Attributes.Add("onclick", "return requiredFieldValidation();");
                Submit.Attributes.Add("onclick", "return fnsubmit();");
                btnupdate.Attributes.Add("onclick", "return fnsubmit();");
                btnDelete.Attributes.Add("onclick", "return fnsubmit();");

                FileUpload1.Attributes["onchange"] = "UploadFile(this)";
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void BindBookDetails()
        {
            try
            {
                DataTable dt = new DataTable();
                int status = 0;
                if (!string.IsNullOrEmpty(txtBookId.Text))
                {
                    dt = objDb.FetchBookDetails(Convert.ToInt32(txtBookId.Text == string.Empty ? 0 : Convert.ToInt32(txtBookId.Text)),
                        string.Empty, string.Empty, string.Empty, 0);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        txtBookName.Text = dt.Rows[0]["Book_Name"].ToString();
                        txtpublisherName.Text = dt.Rows[0]["Publisher_Name"].ToString();
                        txtAuthorName.Text = dt.Rows[0]["Author_Name"].ToString();
                        ddlcat.SelectedValue = dt.Rows[0]["Category"].ToString();
                        status = Convert.ToInt16(dt.Rows[0]["Status"].ToString());
                        if (dt.Rows[0]["BOOK_IMGFILENAME"].ToString() != string.Empty)
                        {
                            Image1.ImageUrl = UploadFolderPath + dt.Rows[0]["BOOK_IMGFILENAME"].ToString();
                           // hdImg1.Value = dt.Rows[0]["BOOK_IMGFILENAME"].ToString();
                        }
                        else
                        {
                            Image1.ImageUrl = UploadFolderPath + "NoImage.png";
                           // hdImg1.Value = "";
                        }
                        setVisibility(status);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }
        protected void UploadFile(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(FileUpload1.FileName))
                {
                    string folderPath = Server.MapPath(UploadFolderPath);
                    //Check whether Directory (Folder) exists.
                    if (!Directory.Exists(folderPath))
                    {
                        //If Directory (Folder) does not exists Create it.
                        Directory.CreateDirectory(folderPath);
                    }
                    //Save the File to the Directory (Folder).
                    FileUpload1.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));
                    hdnimg.Value = FileUpload1.FileName;
                    //Display the Picture in Image control.
                    Image1.ImageUrl = UploadFolderPath + Path.GetFileName(FileUpload1.FileName);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int Bookid = objDb.BookCrud(txtAuthorName.Text, txtBookName.Text, txtpublisherName.Text,
                        Convert.ToInt32(ddlcat.SelectedValue.ToString() == string.Empty ? 0 : Convert.ToInt32(ddlcat.SelectedValue.ToString())),
                        ddlcat.SelectedItem.ToString(), 1, 0, hdnimg.Value);
                    if (Bookid > 0)
                    {
                        txtBookId.Text = Bookid.ToString();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('New Book Inserted Successfully');", true); 
                        BindBookDetails();
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
                    int Bookid = objDb.BookCrud(txtAuthorName.Text, txtBookName.Text, txtpublisherName.Text,
                       Convert.ToInt32(ddlcat.SelectedValue.ToString() == string.Empty ? 0 : Convert.ToInt32(ddlcat.SelectedValue.ToString())),
                       ddlcat.SelectedItem.ToString(), 2, Convert.ToInt32(txtBookId.Text), hdnimg.Value);
                    if (Bookid > 0)
                    {
                        txtBookId.Text = Bookid.ToString();
                        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Updated Successfully');", true); 
                        BindBookDetails();
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
                int Bookid = objDb.BookCrud(txtAuthorName.Text, txtBookName.Text, txtpublisherName.Text,
                Convert.ToInt32(ddlcat.SelectedValue.ToString() == string.Empty ? 0 : Convert.ToInt32(ddlcat.SelectedValue.ToString())),
                ddlcat.SelectedItem.ToString(), 3, Convert.ToInt32(txtBookId.Text), hdnimg.Value);
                if (Bookid > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", "alertMessage('Deleted Successfully');", true); 
                    Response.Redirect("~/Modules/BookDetails.aspx", false);
                    return;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}