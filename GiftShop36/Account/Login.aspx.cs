using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.Cookies["GiftShop"] != null)
        {
            Session["UserID"] = Request.Cookies["GiftShop"]["UserID"];
            Session["FirstName"] = Request.Cookies["GiftShop"]["FirstName"];
            Session.Timeout = 720;
           Response.Redirect("../Admin/AdminDashboard.aspx");
        }

    }

    protected void CmdLogin_Click(object sender, EventArgs e)
    {

        using (GiftShopEntities db = new GiftShopEntities())
        {
            //string encodedPassword = Encryptpass(txtPassword.Text);
            var query = db.DoLogin(txtEmailAddress.Text, txtPassword.Text).ToList();

            if (query.Count > 0)
            {
                Session["UserID"] = query[0].UserID;
                Session["FirstName"] = query[0].FirstName;
                Session.Timeout = 720;
                Response.Redirect("../Admin/AdminDashboard.aspx");

                Response.Cookies["GiftShop"]["UserID"] = query[0].UserID.ToString();
                Response.Cookies["GiftShop"]["FirstName"] = query[0].FirstName;
                Response.Cookies["GiftShop"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                Response.Write("Invalid Email or Password");
            }
        }
    }
}