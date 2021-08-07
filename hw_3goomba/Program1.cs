using System;

namespace GoombaProject // if your namespace is different, modify this line.
{
    class Program
    {
        static void Main(string[] args)
        {
           
            Star star = new Star(4);
            Goomba goomba = new Goomba(4);
            Ground ground = new Ground(120);
            GoombaWalk gWalk = new GoombaWalk(star, goomba, ground);
            Console.Clear();
            gWalk.StarAnimation();

           
        }
    }
}
