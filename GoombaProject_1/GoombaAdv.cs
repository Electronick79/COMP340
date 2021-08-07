using System;

namespace GoombaProject_1 // if your namespace is different, modify this line.
{
    class GoombaAdv : Goomba
    {
        
        private string[] goombaSpriteLeftFoot;
        
        private string[] goombaSpriteRightFoot;
        

        public GoombaAdv(int speed) : base(speed)
        {
            goombaSpriteLeftFoot = new string[10];
            goombaSpriteRightFoot = new string[10];
            SetSprite();

        }
        private void SetSprite()
        {           
        starSprite[0] = @"     ________  ";
        starSprite[1] = @"    /        \ ";
        starSprite[2] = @"   /  \    /  \ ";
        starSprite[3] = @"  /   |    |   \ ";
        starSprite[4] = @" /  -^------^-  \ ";
        starSprite[5] = @"|________________| ";
        starSprite[6] = @"      /    \ ____ ";
        starSprite[7] = @" ____|      /____\ ";
        starSprite[8] = @"/____\ ====         ";
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
        public void UpdatePos()
        { 
            if(direction)
               posX = posX + speed;
            else
              posX = posX - speed;

        }
    }
}