using System;

namespace GoombaProject_1 // if your namespace is different, modify this line.
{
    
    class paragoomba 
    {
        private int length; 
        private string[] groundSprite;
        public Ground( int length){

            this.length = length;
            groundSprite = new string[2];
            SetSprite();
        }
        private void SetSprite()
        {
            string grassOneLayer = ""; 
            for(int i = 0; i < length; i++)
            grassOneLayer += @"/";
        groundSprite[0] = groundOneLayer;
        groundSprite[1] = groundOneLayer; 
        }
        public void DrawSprite()
        {
            foreach(string eachLine in groundSprite)
                 Console.WriteLine(eachLine);
        }






        // rember to remove it
        //can think that goomba constructor is called before 
		//Paragoomba’s SetSprite()
        	public ParaGoomba(int speed) : base(speed)
            {
		
		
		posX = 0;
		this.speed = speed;
		goombaSprite = new string[10];
		direction = true;
		SetSprite(); //Goomba’s one
		SetSprite(); //ParaGoomba’s one
           }



    } 

} 