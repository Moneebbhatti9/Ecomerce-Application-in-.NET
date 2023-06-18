using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_addProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (IsPostBack) return;
        using (GiftShopEntities db = new GiftShopEntities())
        {
            var brands = db.getBrand().ToList();
            ddbrands.DataTextField = "BrandName";
            ddbrands.DataValueField = "BrandID";

            ddbrands.DataSource = brands;
            ddbrands.DataBind();
            ddbrands.Items.Insert(0, new ListItem("Select", "0"));


            var category = db.getCategory().ToList();
            ddcategory.DataTextField = "categoryname";
            ddcategory.DataValueField = "categoryid";

            ddcategory.DataSource = category;
            ddcategory.DataBind();
            ddcategory.Items.Insert(0, new ListItem("Select", "0"));

        }

        if (!IsPostBack)
            using (GiftShopEntities db = new GiftShopEntities())
            {
                if (Request.QueryString["prdId"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["prdId"]);
                    ProductTable product = db.ProductTables.FirstOrDefault(p => p.ProductID == productId);

                    if (product != null)
                    {
                        txtpname.Text = product.ProductName;
                        ddbrands.SelectedValue = product.BrandID.ToString();
                        ddcategory.Text = product.CategoryID.ToString();
                        txtdiameter.Text=product.WatchDiameter.ToString();
                        txtbandsize.Text=product.WatchBandSize.ToString();
                        txtbandcolor.Text = product.watchBandColor;
                        txtdescription.InnerText = product.Description;
                        txtfragrance.Text=product.Fragnance.ToString();
                        txtitemsinstock.Text=product.ProductQuantity.ToString();
                        txtringcolor.Text=product.RingColor.ToString();
                        txtwidth.Text=product.RingWidth.ToString();
                        Txtprice.Text = product.ProductPrice.ToString();
                        txtsize.Text=product.RingSize.ToString();
                    }
                }
            }
    }

    protected void btnsave_Click(object sender, EventArgs e)
    {
        using (GiftShopEntities db = new GiftShopEntities())
        {
            if (pictureuploader.HasFile)
            {

                pictureuploader.SaveAs(Server.MapPath("../Assests/Images/" + pictureuploader.FileName));
                ProductTable p = new ProductTable();

                p.Fragnance = txtfragrance.Text;
                p.ProductImage = pictureuploader.FileName;
                p.WatchDiameter = string.IsNullOrEmpty(txtdiameter.Text) ? 0 : Convert.ToInt32(txtdiameter.Text);
                p.WatchBandSize = string.IsNullOrEmpty(txtbandsize.Text) ? 0 : Convert.ToInt32(txtbandsize.Text);
                p.BrandID = Convert.ToInt32(ddbrands.SelectedValue);
                p.CategoryID = Convert.ToInt32(ddcategory.SelectedValue);
                p.ProductName = txtpname.Text;
                p.Description = txtdescription.InnerText;
                p.ProductPrice = Convert.ToInt32(Txtprice.Text);
                p.ProductQuantity = Convert.ToInt32(txtitemsinstock.Text);
                p.RingColor = txtringcolor.Text;
                p.RingSize = string.IsNullOrEmpty(txtsize.Text) ? 0 : Convert.ToInt32(txtsize.Text);
                p.RingWidth = string.IsNullOrEmpty(txtwidth.Text) ? 0 : Convert.ToInt32(txtwidth.Text);



                db.ProductTables.Add(p);
                db.SaveChanges();

                Response.Redirect("./ProductDashboard.aspx");
            }
            else
            {
                lblpictureuploader.InnerText = "plase select a picture";
            }
        }


    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ProductDashboard.aspx");
    }
    protected void btnchangepic_Click(object sender, EventArgs e)
    {

    }
}
