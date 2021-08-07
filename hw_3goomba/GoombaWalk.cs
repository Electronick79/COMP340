using System;

namespace GoombaProject // if your namespace is different, modify this line.
{
    class GoombaWalk
    {
        private Star star;
        private Goomba goomba;
        private Ground ground;

    }
    public GoombaWalk(Star star, Goomba goomba, Ground ground)
    {
      this.star = star;
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