using System;

namespace starProject // if your namespace is different, modify this line.
{
    class Star 
    {
        
        private int posX;
        private string[] starSprite;
        public Star(int posx)

        {
          
          
            this.posX = posX;
            starSprite = new string[6];
            SetSprite();

        }
          // @: printing string as it self
          // "\n" --> new line 
          //@ "\n" -->
        private void SetSprite()
        {          
         starSprite[0] = @"     ________  ";
         starSprite[0] = @"    /        \ ";
         starSprite[0] = @"   /  \    /  \ ";
         starSprite[0] = @"  /   |    |   \ ";
         starSprite[0] = @" /  -^------^-  \ ";
         starSprite[0] = @"|________________| ";
         starSprite[0] = @" ____ /    \ ";  
         starSprite[0] = @"/____\      |____ ";
         starSprite[0] = @"       ==== /____\ ";
         starSprite[0] = @"                     ";
        }

        public void DrawSprite()
        {  
            string spaces = "";  
            for(int i = 0; i > posX; i++)
                spaces += "";
            foreach(string eachLine in starSprite)
                  Console.WriteLine(spaces + eachLine);

        }
    }
}