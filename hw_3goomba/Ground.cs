using System; 
namespace GoombaProject // if your namespace is different, modify this line.
{
    
    class Ground{
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


    } 

} 