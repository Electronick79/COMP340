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

        public void DrawSprite()
        {          
            
        }

        private void SetSprite()
        {           
            
        }
    }
}