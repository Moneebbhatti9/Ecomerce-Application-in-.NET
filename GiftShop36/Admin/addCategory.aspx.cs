using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchCategory();
    }


    protected void addCategory_Click(object sender, EventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            CategoryTable C = new CategoryTable();
            C.CategoryName = txtCatName.Text;

            db.CategoryTables.Add(C);
            db.SaveChanges();
            txtCatName.Text = "";
        }

        fetchCategory();



    }

    protected void categoryGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "delete")
        {
            using (GiftShopEntities db = new GiftShopEntities())
            {
                int CategoryID = Convert.ToInt32(e.CommandArgument);
                db.deleteCategory(CategoryID);
            }
            fetchCategory();

        }

    }

    protected void categoryGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void fetchCategory()
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            var category = db.CategoryTables.ToList();
            categoryGV.DataSource = category;
            categoryGV.DataBind();
        }
    }

}