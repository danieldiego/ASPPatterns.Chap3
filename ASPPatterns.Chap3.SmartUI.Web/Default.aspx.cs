using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASPPatterns.Chap3.SmartUI.Web
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)        
        {
            if (e.Row.RowType != DataControlRowType.DataRow) return;
            var rrp = decimal.Parse(((System.Data.DataRowView)e.Row.DataItem)["RRP"].ToString());                
            var sellingPrice = decimal.Parse(((System.Data.DataRowView)e.Row.DataItem)["SellingPrice"].ToString());
            var lblSavings = (Label)e.Row.FindControl("lblSavings");                
            var lblDiscount = (Label)e.Row.FindControl("lblDiscount");

            lblSavings.Text = DisplaySavings(rrp, ApplyExtraDiscountsTo(sellingPrice));                
            lblDiscount.Text = DisplayDiscount(rrp, ApplyExtraDiscountsTo(sellingPrice));
            //lblSellingPrice.Text = String.Format("{0:C}", ApplyExtraDiscountsTo(sellingPrice));
        }
        protected string DisplayDiscount(decimal rrp, decimal salePrice)        
        {            
            var discountText = "";
            if (rrp > salePrice) discountText = String.Format("{0:C}", (rrp - salePrice)); 
            return discountText;         
        }
        protected string DisplaySavings(decimal rrp, decimal salePrice)        
        {            
            var savingsTest = "";
            if (rrp > salePrice) savingsTest = (1 - (salePrice / rrp)).ToString("#%");
            return savingsTest;        
        }

        protected decimal ApplyExtraDiscountsTo(decimal originalSalePrice)
        {
            var price = originalSalePrice; 
            int discountType = Int16.Parse(ddlDiscountType.SelectedValue);
            if (discountType == 1)
            {
                price = price * 0.95M;
            }
            
            return price;
        }

        protected void ddlDiscountType_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
    }
}