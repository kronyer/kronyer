using System.Runtime.CompilerServices;
using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Running;

[InlineArray(1000)]
public struct MeuArrayFixoGrande
{
    private int _elemento;
}

[MemoryDiagnoser] 
public class ArrayBenchmarks
{
    [Benchmark(Baseline = true)]
    public int ArrayTradicionalHeap()
    {
        // Tamanho 1000 vai forçar o .NET a alocar na Heap pesada
        int[] array = new int[1000];
        for (int i = 0; i < 1000; i++) array[i] = i;
        return array[500];
    }

    [Benchmark]
    public int ArrayStackAlloc()
    {
        // Força a alocação dos mesmos 1000 na Stack
        Span<int> array = stackalloc int[1000];
        for (int i = 0; i < 1000; i++) array[i] = i;
        return array[500];
    }

    [Benchmark]
    public int UsoInlineArray()
    {
        // Como é uma struct, também vai forçar os 1000 na Stack
        var array = new MeuArrayFixoGrande();
        for (int i = 0; i < 1000; i++) array[i] = i;
        return array[500];
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        // Roda os testes no terminal (Lembre-se de rodar em modo Release!)
        BenchmarkRunner.Run<ArrayBenchmarks>();
    }
}