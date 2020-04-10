using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmptyWeb
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Numeration();
        }

        //Метод для нумерации строк в DGV, помогающий правильно отразить позицию танцора в рейтинге, а также спорные места
        private void Numeration()
        {
            GridView1.Rows[0].Cells[0].Text = "1";

            for (int i = 1; i < GridView1.Rows.Count; i++)
            {
                int count = Convert.ToInt32(GridView1.Rows[i - 1].Cells[0].Text);

                GridView1.Rows[i].Cells[0].Text = (count + 1).ToString();

                if (GridView1.Rows[i].Cells[3].Text == GridView1.Rows[i - 1].Cells[3].Text & Convert.ToInt32(GridView1.Rows[i - 1].Cells[3].Text) > 0)
                {
                    GridView1.Rows[i].Cells[0].Text = GridView1.Rows[i - 1].Cells[0].Text;
                   
                }

            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_Sorted(object sender, EventArgs e)
        {
           
        }
    }
}