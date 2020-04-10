using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace EmptyWeb
{
    public partial class DataEnter : System.Web.UI.Page
    {
        MySqlConnection conn;
        MySqlCommand cmd;
        String queryStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            EnteringDataComp();

        }

        private void EnteringDataComp()
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
            conn = new MySqlConnection(connString);
            conn.Open();
            queryStr = "";
            queryStr = "INSERT INTO competition (title, place, score, dancer_num ) VALUES( @title, @place, @score, @dancer_num )";
            cmd = new MySqlCommand(queryStr, conn);
            MySqlParameter titleParam = new MySqlParameter("@title", TextBox1.Text);
            MySqlParameter placeParam = new MySqlParameter("@place", TextBox2.Text);
            MySqlParameter scoreParam = new MySqlParameter("@score", TextBox3.Text);
            MySqlParameter dancer_numParam = new MySqlParameter("@dancer_num", TextBox4.Text);

            cmd.Parameters.Add(titleParam);
            cmd.Parameters.Add(placeParam);
            cmd.Parameters.Add(scoreParam);
            cmd.Parameters.Add(dancer_numParam);
            cmd.ExecuteReader();
            conn.Close();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Redirect(Request.Path);
        }

        private void EnteringDataDance()
        {
            String connString = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ToString();
            conn = new MySqlConnection(connString);
            conn.Open();
            queryStr = "";
            queryStr = "INSERT INTO dance (dnum, name) VALUES( @dnum, @name)";
            cmd = new MySqlCommand(queryStr, conn);
            MySqlParameter dnumParam = new MySqlParameter("@dnum", TextBox5.Text);
            MySqlParameter nameParam = new MySqlParameter("@name", TextBox6.Text);

            cmd.Parameters.Add(dnumParam);
            cmd.Parameters.Add(nameParam);
            cmd.ExecuteReader();
            conn.Close();
            TextBox5.Text = "";
            TextBox6.Text = "";
            Response.Redirect(Request.Path);

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            EnteringDataDance();
        }
    }
}