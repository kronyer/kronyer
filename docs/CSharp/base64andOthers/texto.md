---
layout: default
title: Encoding vs Hashing
parent: CSharp
nav_order: 1
---

# Base 64

## Encoding vs hashing
Base 64 e os outros "bases" citados são uma forma de encoding, isso é, transformar um dado em uma sequencia de caracteres, diferente de hashing que é uma função unidirecional, ou seja, não é possível recuperar o dado original a partir do hash.

Com isso, também é nítido que são usados para propósitos diferentes, o encoding é usado geralmente para transmitir dados (de foram segura?), enquanto o hashing é usado para verificar a integridade dos dados ou para armazenar senhas de forma segura.

Como similaridade, ambas são determinísticas, ou seja, o mesmo dado de entrada sempre resultará no mesmo resultado.

## Princípios matemáticos de hashing e encoding

### Encoding

O encoding pode ser representado matematicamente como uma função $f: A \to B$, onde $A$ é o conjunto de dados originais e $B$ é o conjunto de dados codificados.O encoding é invertível (bijetor), ou seja:$$\exists f^{-1} : B \to A \mid f^{-1}(f(x)) = x, \quad \forall x \in A$$Em outras palavras, existe uma função inversa $f^{-1}$ que, quando aplicada ao resultado de $f$, recupera o dado original $x$ de forma íntegra. Portanto, a relação entre $f$ e $f^{-1}$ é de identidade: $f^{-1}(f(x)) = x$ para todo $x$ em $A$.

### Hashing

O hashing pode ser representado matematicamente como uma função $h: A \to B$, onde $A$ é o conjunto de dados originais e $B$ é o conjunto de hashes.O hashing é unidirecional (one-way), o que implica que não existe uma função inversa $h^{-1}$ capaz de reverter o processo para todos os elementos:$$\nexists f : B \to A \mid f(h(x)) = x, \quad \forall x \in A$$Diferente do encoding, o hashing não é uma função injetora. Como o conjunto de destino $B$ é finito e geralmente menor que o conjunto de origem $A$ ($|B| < |A|$), aplica-se o Princípio da Casa dos Pombos, permitindo a existência de colisões:$$\exists x_1, x_2 \in A \mid x_1 \neq x_2 \land h(x_1) = h(x_2)$$Portanto, a operação de inversão é logicamente impossível, pois um único hash $b \in B$ pode estar associado a múltiplos valores de origem em $A$, tornando a recuperação do dado original $x$ ambígua e computacionalmente inviável.


## Base 64

Base 64 é um sistema de codificação que representa dados binários em formato de texto usando um conjunto de 64 caracteres. Ele é amplamente utilizado para transmitir dados binários, como imagens, arquivos e outros tipos de dados, em formatos que só aceitam texto, como e-mails e URLs.

É chamado de 64, pois existem 64 caracteres possíveis para representar os dados codificados. Cada caractere representa um valor de 6 bits, o que significa que cada grupo de 3 bytes (24 bits) é codificado em 4 caracteres de base 64.

Os caracteres são:
* Letras maiúsculas (A-Z)
* Letras minúsculas (a-z)
* Dígitos (0-9)
* Símbolos (+ e /)

Matematicamente, temos:$$\frac{24 \text{ bits}}{8 \text{ bits/byte}} = 3 \text{ bytes}$$$$\frac{24 \text{ bits}}{6 \text{ bits/caractere}} = 4 \text{ caracteres}$$

E isso explica o aumento de 33% no tamanho dos dados codificados em base 64, já que cada grupo de 3 bytes é representado por 4 caracteres.


### Uso em c#
Imagine o cenário onde você tem um arquivo de imagem e deseja transmiti-lo por algum canal que só aceite texto. Você pode usar o base 64 para codificar o arquivo de imagem em uma string de texto, que pode ser facilmente transmitida e depois decodificada para recuperar a imagem original.

```csharp

string imagePath = "caminho/para/sua/imagem.jpg";

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

File.WriteAllBytes("caminho/para/sua/imagem_decodificada.jpg", decodedBytes);
```

### Base 64 na URL
Base 64 URL é uma variação do base 64 que é projetada para ser segura para uso em URLs e nomes de arquivos. Ele substitui os caracteres '+' e '/' por '-' e '_', respectivamente, para evitar problemas de codificação em URLs.

Isso é, se usássemos o base 64 normal em uma URL, os caracteres '+' e '/' poderiam ser interpretados de forma errada, causando problemas na transmissão dos dados. Com a base 64 URL, esses caracteres são substituídos por '-' e '_', garantindo que a string codificada seja segura para uso em URLs.

O .NET 9 introduziu suporte nativo para base 64 URL, o que facilita a codificação e decodificação de dados usando esse formato.

```csharp
string imagePathUrl = "dummy.jpg";
byte[] imageBytesUrl = File.ReadAllBytes(imagePathUrl);

string base64UrlString = Base64Url.EncodeToString(imageBytes);

Console.WriteLine($"Tamanho original: {imageBytes.Length} bytes");
Console.WriteLine($"Tamanho Base64Url: {base64UrlString.Length} caracteres");

//razao de aumento de tamanho
double increaseRatioUrl = (double)base64UrlString.Length / imageBytesUrl.Length;
Console.WriteLine($"Aumento de tamanho do base64Url: {increaseRatio:P2}");

// 2. Decodificar (Lida com a falta de '=' e caracteres de URL sem erro)
byte[] decodedUrlBytes = Base64Url.DecodeFromChars(base64UrlString);

File.WriteAllBytes("imagem_url.jpg", decodedUrlBytes);
```

### Outras bases
Além do base 64 e base 64 URL, existem outras variações de codificação em diferentes bases, como base 62, base 58, entre outras. Cada uma delas tem suas próprias características e usos específicos, dependendo do contexto em que são aplicadas.

#### Base 62
O base62, por exemplo, é uma variação que utiliza um conjunto de 62 caracteres (letras maiúsculas, minúsculas e dígitos) para codificar dados. Ele pode ser usado em situações onde se deseja uma representação mais compacta do que o base 64, mas ainda assim legível e fácil de transmitir.


#### Base 58
Já o base 58 é uma variação que utiliza um conjunto de 58 caracteres (letras maiúsculas, minúsculas e dígitos, mas sem os caracteres '0', 'O', 'I' e 'l' para evitar confusões) para codificar dados. Ele é frequentemente usado em sistemas de criptomoedas para representar endereços de carteira de forma mais compacta e legível, evitando caracteres que possam ser confundidos visualmente.


#### Base 85
O base 85 é outra variação que utiliza um conjunto de 85 caracteres para codificar dados. Ele é mais eficiente do que o base 64 em termos de compactação, mas pode ser menos legível e mais difícil de transmitir em alguns contextos.

