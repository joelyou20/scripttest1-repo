void Main()
{
	Product pen = new Product(1, "Pen");
	Product pineapple = new Product(8, "Pineapple");
	Product apple = new Product(3, "Apple");
	
	List<Product> cart = new List<Product>() {pen, pineapple, apple};

	string receipt = ReceiptService.BuildReceipt(cart);
	
	Console.WriteLine(receipt);
}

public class Product
{
	public int Price;
	public string Name;
	
	public Product(int value, string name)
	{
		this.Price = value;
		this.Name = name;
	}
}

public class ReceiptService
{
	public static Product item;
	
	public static string BuildReceipt(List<Product> list)
	{
		string a = "Item   | Price  ";
		a = a + "\n---------------";

		// loop through items
		for(int i = 0; i < list.Count; i++)
		{
			item = list[i];
			
			// if name of item is less than 6
			if (item.Name.Length < 6) 
			{
				item.Name = item.Name.PadRight(6);
			}
			
			// if name of item is greater than 6
			if (item.Name.Length > 6) 
			{
				item.Name = item.Name.Substring(0, 6);
			}
			
			a = a + "\n";
			a = a + item.Name + " | " + item.Price;
		}
		
		// declare variable equals 0
		int number = 0;
		for (int i = 0; i < list.Count; i++)
		{
			number = number + list[i].Price;
		}
		
		a = a + "\n\n";
		a = a + "Total: " + number;
		
		return a;
	}
}