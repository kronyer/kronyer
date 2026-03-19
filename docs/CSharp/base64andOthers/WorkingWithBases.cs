using System.Buffers.Text;


string imagePath = "dummy.jpg";

byte[] imageBytes = File.ReadAllBytes(imagePath);

//checar o tamanho do arquivo
Console.WriteLine($"Tamanho do arquivo original: {imageBytes.Length} bytes");

string base64String = Convert.ToBase64String(imageBytes);

//checar o tamanho do arquivo codificado
Console.WriteLine($"Tamanho do arquivo codificado: {base64String.Length} caracteres");


Console.WriteLine("Imagem codificada em Base 64:");
Console.WriteLine(base64String);


//razao de aumento de tamanho
double increaseRatio = (double)base64String.Length / imageBytes.Length;
Console.WriteLine($"Aumento de tamanho: {increaseRatio:P2}");

byte[] decodedBytes = Convert.FromBase64String(base64String);

File.WriteAllBytes("imagem_decodificada.jpg", decodedBytes);


// para base64Url:

string imagePathUrl = "dummy.jpg";
byte[] imageBytesUrl = File.ReadAllBytes(imagePathUrl);

// 1. Codificar para Base64Url (Troca + por - e / por _)
// O .NET 9 também remove o padding '=' aqui por padrão
string base64UrlString = Base64Url.EncodeToString(imageBytes);

Console.WriteLine($"Tamanho original: {imageBytes.Length} bytes");
Console.WriteLine($"Tamanho Base64Url: {base64UrlString.Length} caracteres");

//razao de aumento de tamanho
double increaseRatioUrl = (double)base64UrlString.Length / imageBytesUrl.Length;
Console.WriteLine($"Aumento de tamanho do base64Url: {increaseRatio:P2}");

// 2. Decodificar (Lida com a falta de '=' e caracteres de URL sem erro)
byte[] decodedUrlBytes = Base64Url.DecodeFromChars(base64UrlString);

File.WriteAllBytes("imagem_url.jpg", decodedUrlBytes);