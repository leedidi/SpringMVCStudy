
import java.util.Vector;
import java.util.Iterator;

public class ISetup
{
	Vector<Ingredient> v = new Vector<Ingredient>();

	Ingredient[] ig = new Ingredient[12];

	String[] name = {"오이", "당근", "양파", "A", "B", "C", "D", "E", "F", "G", "H", "I",};
	int[] num = {5, 4, 3, 1, 2, 6, 7, 8, 9, 10, 11, 12};
	int[] kcal = {100, 200, 300, 1, 2, 6, 7, 8, 9, 10, 11, 12};

	public void firstSet()
	{
		for (int i=0; i<12; i++)
		{
			v.add(new Ingredient(name[i], num[i], kcal[i]));
		}

	}

	public void result()
	{
		System.out.println(v.get(0).name);
		System.out.println(v.get(0).num);
		System.out.println(v.get(0).kcal);
	}
}