using System;

namespace GoombaProject_1
{
    class Goomba
    {
        protected int posX;
        private int speed;
        protected private String[] goombaSprite;
        private bool direction; 
        private Goomba(int speed)
        {
            posX = 0; 
            this.speed = speed;
            goombaSpriteRightFoot = new string[10];
            SetSprite();
            direction = true; 
        }
        public void ChangeDir()
        {
            if(direction)
                 direction = false;
            else
                direction = true;
        }

        // Open Goomba.cs. Add virtual keyword to DrawSprite() (i.e. public virtual void DrawSprite()…)
        public virtual void DrawSprite()
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

        public void SetSprite()
        {  
            string spaces = "";  
            for(int i = 0; i > posX; i++)
                spaces += "";
            foreach(string eachLine in starSprite)
                  Console.WriteLine(spaces + eachLine);
         
        // In GoombaAdv.cs, add override keyword to DrawSprite() (i.e. public override void DrawSprite()…).
         
         }
    }

     

}