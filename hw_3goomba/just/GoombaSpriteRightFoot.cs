using System;

namespace GoombaProject_1 // if your namespace is different, modify this line.
{
    class goombaSpriteRightFoot 
    {
        
        private int posX;
        private string[] goombaSpriteRightFootSprite;
        public Star(int posx)

        {
          
          
            this.posX = posX;
            goombaSpriteRightFootSprite = new string[6];
            SetSprite();

        }
          // @: printing string as it self
          // "\n" --> new line 
          //@ "\n" -->
        private void SetSprite()
        {          
         starSprite[0] = @"     ________  ";
         starSprite[1] = @"    /        \ ";
         starSprite[2] = @"   /  \    /  \ ";
         starSprite[3] = @"  /   |    |   \ ";
         starSprite[4] = @" /  -^------^-  \ ";
         starSprite[5] = @"|________________| ";
         starSprite[6] = @" ____ /    \ ";  
         starSprite[7] = @"/____\      |____ ";
         starSprite[8] = @"       ==== /____\ ";
         starSprite[9] = @"                     ";
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