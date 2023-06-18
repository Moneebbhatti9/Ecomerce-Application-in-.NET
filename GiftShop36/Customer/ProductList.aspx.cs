using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_ProductList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        using (GiftShopEntities db = new GiftShopEntities())
        {
            var brand = db.getBrand().ToList();
            brandGV.DataSource = brand;
            brandGV.DataBind();

            if (Request.QueryString["brand"] != null)
            {
                var filteredBrand = Request.QueryString["brand"];
                var filteredProducts = db.FilterProductbyBrand(filteredBrand).ToList();
                DLFilteredProducts.DataSource = filteredProducts;
                DLFilteredProducts.DataBind(); 
            }
            else
            {
                var allProducts = db.getProductList().ToList();
                DLFilteredProducts.DataSource = allProducts;
                DLFilteredProducts.DataBind();
            }

            if (Request.QueryString["brand"] != null)
            {
                var brandName = Request.QueryString["brand"];
                displayTitleConditionally.InnerHtml = brandName;
            }

            else
            {
                displayTitleConditionally.InnerHtml = "All Products";
            }

        }

    }

    protected void brandGV_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            Response.Redirect("./ProductList.aspx?brand=" + e.CommandArgument);
        }     
    }

    protected void AddToCartCommand(object sender, CommandEventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {

            AddToCartTable m = new AddToCartTable();
            m.ProductID = Convert.ToInt32(((string)e.CommandArgument).ToString());
            m.UserUniqueKey = Request.Cookies["giftShopCustomerID"]["uniqueID"];
            m.created_at = DateTime.Now;

            db.AddToCartTables.Add(m);
            db.SaveChanges();
        }
    }

    protected void allProducts_Click(object sender, EventArgs e)
    {
        Response.Redirect("./ProductList.aspx");
    }
}