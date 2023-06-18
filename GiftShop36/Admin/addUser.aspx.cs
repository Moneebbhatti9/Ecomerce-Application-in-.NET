using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            using (GiftShopEntities db = new GiftShopEntities())
            {
                if (Request.QueryString["usrId"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["usrId"]);
                    userTable users = db.userTables.FirstOrDefault(u => u.UserID == userId);

                    if (users != null)
                    {
                        firstName.Text = users.FirstName;
                        lastName.Text = users.LastName;
                        emailAddress.Text = users.Email;
                        password.Text = users.Password;
                    }
                }
            }

    }


    protected void cmdSave_Click(object sender, EventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {

            if (Request.QueryString["usrId"] != null)
            {
                int userId = Convert.ToInt32(Request.QueryString["usrId"]);
                userTable users = db.userTables.FirstOrDefault(u => u.UserID == userId);
                users.FirstName = firstName.Text;
                users.LastName = lastName.Text;
                users.Email = emailAddress.Text;
                users.Password = (password.Text);
                db.SaveChanges();
            }
            else
            {
                /* var emailExist = db.EmailExist(txtEmailAddress.Text);

                 if (emailExist.ToList().FirstOrDefault().value>0)
                 {
                     Response.Write("User Already Registered With this Email");
                 }
                 else
                 {

                 }*/
                userTable user = new userTable();
                user.FirstName = firstName.Text;
                user.LastName = lastName.Text;
                user.Email = emailAddress.Text;
                user.Password = (password.Text);
                user.Status = true;

                db.userTables.Add(user);
                db.SaveChanges();

            }
            Response.Redirect("./AdminDashboard.aspx");
        }
    }

}