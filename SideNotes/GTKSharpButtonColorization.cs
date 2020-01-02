namespace GtkButtonColorization
{

    using Gtk;
    using System;
    using System.Drawing;

    public class buttons
    {

        public static void Main(string[] args)
        {

            Application.Init();

            /* Create a new window */
            Window window = new Window("Colorizing/Pango-izing ButtonTests!");

            /* It's a good idea to do this for all windows. */
            window.DeleteEvent += delete_event;

            /* Sets the border width of the window. */
            window.BorderWidth = 20;

            /* Create a new button */
            Button button = new Button();

            /* Connect the "clicked" signal of the button to our callback */
            button.Clicked += callback;

            /* Create Some Label */
            Label clickme = new Label();
            clickme.Text = "Click Me For Mayhem";

/* STYLE OPTION 1 =============================================== */

            // This will work for coloring
            clickme.ModifyFg(Gtk.StateType.Normal, new Gdk.Color(237, 52, 112));
            //clickme.ModifyStyle();

/* STYLE OPTION 2 =============================================== */
            // This works for coloring
            //clickme.Markup = "<span fgcolor=\"red\"> Cus Damato </span>";


/* STYLE OPTION 3 ===============================================
             * 
             * This will work using Pango AttrList. 
             * Far more complicated but far more powerful
             * I couldnt get UnderlineColor to work thought */

            //Pango.AttrList textattrs = new Pango.AttrList();
            //Pango.Attribute attr1 = new Pango.AttrUnderline(Pango.Underline.Double);
            //Pango.Attribute attr2 = new Pango.AttrWeight(Pango.Weight.Bold);
            //Pango.Attribute attr3 = new Pango.AttrSize(Convert.ToInt32(10 * Pango.Scale.PangoScale), true);

            //Pango.Color colorama = new Pango.Color();
            //colorama.Red = 172;
            //colorama.Blue = 122;
            //colorama.Green = 0;
            //Pango.Attribute attr4 = new Pango.AttrUnderlineColor(colorama);

            //// Add the created attribute to the attrlist
            //textattrs.Insert(attr1);
            //textattrs.Insert(attr2);
            //textattrs.Insert(attr3);
            //textattrs.Insert(attr4);

            //// Use Attribute property on the GtkLabel to set the new list
            //Console.WriteLine(clickme.Attributes);
            //clickme.Attributes = textattrs;

/* END OPTIONS

            /* Pack and show all our widgets */
            //box.Show();

            button.Add(clickme);

            button.Show();

            window.Add(button);

            window.ShowAll();

            /* Rest in gtk_main and wait for the fun to begin! */
            Application.Run();
        }

        /* Our usual callback function */
        static void callback(object obj, EventArgs args)
        {
            Console.WriteLine("The Button was pressed");
        }

        /* another callback */
        static void delete_event(object obj, DeleteEventArgs args)
        {
            Application.Quit();
        }

    }
}
