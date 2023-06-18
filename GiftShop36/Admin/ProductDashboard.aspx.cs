using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ProductDashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        fetchProduct();
    }

    protected void fetchProduct()
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            var product = db.getProductList().ToList();
            ProductGV.DataSource = product;
            ProductGV.DataBind();

        }
    }




    protected void ProductGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        if (e.CommandName == "edit")
        {
            Response.Redirect("./addProduct.aspx?prdId=" + e.CommandArgument);
        }
        else if (e.CommandName == "delete")
        {
            using (GiftShopEntities db = new GiftShopEntities())
            {
                int productID = Convert.ToInt32(e.CommandArgument);
                db.deleteProduct(productID);
            }
            fetchProduct();

        }


    }

    protected void ProductGV_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }

    protected void ProductGV_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

}