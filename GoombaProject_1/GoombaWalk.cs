using System;

namespace  GoombaProject_1// if your namespace is different, modify this line.
{
    class GoombaWalk
    {
         private GoombaSpriteLeftFoot goombaSpriteLeftFoot;
        private GoombaSpriteRightFoot goombaSpriteRight;
        private Goomba goomba;
        private GoombaAdv goombaAdv;
        private Goomba goomba;
        private Ground ground;

    
    public GoombaWalk(GoombaAdv goombaAdv, Goomba goomba, Ground ground)
    {
      this.goombaAdv = goombaAdv;
      this.goomba = goomba;
      this.ground = ground;
    }
    public void StartAnimation()
    {
        // put animation code that used to test Goomba class
        for(int i = 0; i < 3; i++)
        {
            DrawFrame();
            goomba.UpdatePost();;
        }
        goomba.ChangeDir();
        GoombaAdv.UpdatePos();
        for(int i = 0; i < 3; i++)
        {
              DrawFrame();
             goomba.UpdatePosX();
        }
    
    
    }
    private void DrawFrame()
        {
        star.DrawSprite();
        GoombaAdv.DrawSprite();
        Ground.DrawSprite();
        }
    }
    

}



