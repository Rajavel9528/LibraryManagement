﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using LibraryManagement;
using System.Data;

namespace LibraryManagement
{
    public class DBProcess
    {
        CommonClass objComCls = new CommonClass();
        public int BookCrud(string strAuthor, string strBook, string strPublisher, int intCatid, string strCatDesc,int intOperation,
            int intBookid,string strBookImgName)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@AuthorName", strAuthor);
                cmd.Parameters.AddWithValue("@BookName", strBook);
                cmd.Parameters.AddWithValue("@PublisherName", strPublisher);
                cmd.Parameters.AddWithValue("@Categoryid", intCatid);
                cmd.Parameters.AddWithValue("@Catdesc", strCatDesc);
                cmd.Parameters.AddWithValue("@Bookid", intBookid);
                cmd.Parameters.AddWithValue("@Bookimgname", strBookImgName);
                cmd.Parameters.AddWithValue("@OPERATION", intOperation);
                SqlParameter outParam = new SqlParameter("@Newno", System.Data.SqlDbType.Int);
                outParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outParam);
                cmd.CommandType = CommandType.StoredProcedure;
                int Bookid = objComCls.ExecuteQueryInt("crudttblBook", cmd, "Newno");
                return Bookid;

            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public int UserCrud(string strUserName, string strPwd, int UserRole, int intOperation,
               int intUserID)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@user_Name", strUserName);
                cmd.Parameters.AddWithValue("@user_Pwd", strPwd);
                cmd.Parameters.AddWithValue("@User_Role", UserRole);
                cmd.Parameters.AddWithValue("@OPERATION", intOperation);
                cmd.Parameters.AddWithValue("@Userid", intOperation);
                SqlParameter outParam = new SqlParameter("@Newno", System.Data.SqlDbType.Int);
                outParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outParam);
                cmd.CommandType = CommandType.StoredProcedure;
                int Bookid = objComCls.ExecuteQueryInt("crudtbluser", cmd, "Newno");
                return Bookid;
            }
            catch (Exception ex)
            {
                return -1;
            }
        }
        public DataTable GetUserDetails(int UserID, int Status)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid", UserID);
                cmd.Parameters.AddWithValue("@Status", Status);
                return objComCls.SpDtTbl("GetUserDetails", cmd);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable FetchBookDetails(int Bookid, string strPublisher, string strBook, string strAuth, int intCat,
            int intLendStatus = 0)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@BOOKID", Bookid);
                cmd.Parameters.AddWithValue("@PUBLISHERNAME", strPublisher);
                cmd.Parameters.AddWithValue("@BOOKNAME", strBook);
                cmd.Parameters.AddWithValue("@CATEGORY", intCat);
                cmd.Parameters.AddWithValue("@AUTHOR", strAuth);
                cmd.Parameters.AddWithValue("@LendStatus", intLendStatus);
                
                return objComCls.SpDtTbl("GetBookDetails", cmd);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public DataTable CheckUser(string strUser, string strPwd)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@USERNAME", strUser);
                cmd.Parameters.AddWithValue("@PWD", strPwd);
                return objComCls.SpDtTbl("GetLoginUser", cmd);
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public int LendBook(int intBookid,int intUserid)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Parameters.AddWithValue("@Userid", intUserid);
                cmd.Parameters.AddWithValue("@Bookid", intBookid);
                SqlParameter outParam = new SqlParameter("@Newno", System.Data.SqlDbType.Int);
                outParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(outParam);
                cmd.CommandType = CommandType.StoredProcedure;
                int id = objComCls.ExecuteQueryInt("LendBook", cmd, "Newno");
                return id;

            }
            catch (Exception ex)
            {
                return -1;
            }
        }
    }
}