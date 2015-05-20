public class Seashells {
	public static void main(String[] args) {
		String sen = "she sells seashells by the seashore"; // initial sentence
		String delim = "[ ]+"; // for find spaces
		String[] words = sen.split(delim); // split sentence into array of separate words
		
		for(int i=0; i<words.length; i++)
		{
			if(i%2==1)
			{
				words[i] = Character.toUpperCase(words[i].charAt(0))+words[i].substring(1); // capitalize every odd word
			}
			System.out.println(words[i]);
		}
	}
}
