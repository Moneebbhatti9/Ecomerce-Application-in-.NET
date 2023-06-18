using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminDashBoard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fillUser();
    }

    protected void fillUser()
    {


        using (GiftShopEntities db = new GiftShopEntities())
        {
            var Users = db.getUsers().ToList();
            GV.DataSource = Users;
            GV.DataBind();
        }

    }

    protected void addUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("./addUser.aspx");
    }

    protected void GV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void GV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void GV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            Response.Redirect("./addUser.aspx?usrId=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using (GiftShopEntities db = new GiftShopEntities())
            {
                int UserID = Convert.ToInt32(e.CommandArgument);
                db.DeleteUsers(UserID);
            }
            fillUser();

        }
    }

}