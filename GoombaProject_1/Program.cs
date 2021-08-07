using System;

namespace GoombaProject_1
{
    class Program
    {
        static void Main(string[] args)
        {
        
            GoombaAdv goombaAdv = new goombaAdv(20);
            Goomba goomba = new Goomba(20);
            Ground ground = new Ground(120);
            GoombaWalk gWalk = new GoombaWalk(goombaAdv, goomba, ground);
            Console.Clear();
            gWalk.StarAnimation();
        }
    }
}
