using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addBrand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchBrand();   
    }


    protected void addBrand_Click(object sender, EventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            BrandTable B = new BrandTable();
            B.BrandName = txtBrandName.Text;

            db.BrandTables.Add(B);
            db.SaveChanges();
            txtBrandName.Text = "";
        }

        fetchBrand();
    }

    protected void brandGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }


    protected void fetchBrand()
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            var brand = db.BrandTables.ToList();
            brandGV.DataSource = brand;
            brandGV.DataBind();
        }
    }

    protected void brandGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            using (GiftShopEntities db = new GiftShopEntities())
            {
                int BrandID = Convert.ToInt32(e.CommandArgument);
                db.deleteBrand(BrandID);
            }
            fetchBrand();

        }
    }
}