using System;

namespace GoombaProject // if your namespace is different, modify this line.
{
    class GoombaAdv : Goomba
    {
        private int posX;
        private int speed;
        private string[] goombaSpriteLeftFoot;
        private bool direction;
        

        public GoombaAdv(int speed) 
        {
            posX =0;
            this.speed = speed;
            goombaSpriteLeftFoot = new string[10];
            goombaSpriteRightFoot = new string[10];
            SetSprite();
            direction = true;
            
        }
        private void changeDir()
        {
            if(direction) direction = false;
            else direction = new;
        }
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
            string space = "";
            for(int i = 0; i < posX; i++)
                spaces += "";
            foreach(string each in goombaSprite)
                 Console.WriteLine(spaces + eachLine);          
             
        }
        public void UpdatePos()
        { 
            if(direction)
               posX = posX + speed;
            else
              posX = posX - speed;
        }
    }
}