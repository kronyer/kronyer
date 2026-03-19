// IL code: inline_arrays_benchmark
.class private auto ansi '<Module>'
{
} // end of class <Module>

.class public sequential ansi sealed beforefieldinit MeuArrayFixoGrande
	extends [System.Runtime]System.ValueType
{
	.custom instance void [System.Runtime]System.Runtime.CompilerServices.InlineArrayAttribute::.ctor(int32) = (
		01 00 e8 03 00 00 00 00
	)
	// Fields
	.field private int32 _elemento

} // end of class MeuArrayFixoGrande

.class public auto ansi beforefieldinit ArrayBenchmarks
	extends [System.Runtime]System.Object
{
	.custom instance void [BenchmarkDotNet]BenchmarkDotNet.Attributes.MemoryDiagnoserAttribute::.ctor(bool) = (
		01 00 01 00 00
	)
	// Methods
	.method public hidebysig 
		instance int32 ArrayTradicionalHeap () cil managed 
	{
		.custom instance void [BenchmarkDotNet.Annotations]BenchmarkDotNet.Attributes.BenchmarkAttribute::.ctor(int32, string) = (
			01 00 0e 00 00 00 4a 2f 68 6f 6d 65 2f 70 65 64
			72 6f 2f 54 65 78 74 6f 73 2f 43 53 68 61 72 70
			2f 69 6e 6c 69 6e 65 5f 61 72 72 61 79 73 2f 69
			6e 6c 69 6e 65 5f 61 72 72 61 79 73 5f 62 65 6e
			63 68 6d 61 72 6b 2f 50 72 6f 67 72 61 6d 2e 63
			73 01 00 54 02 08 42 61 73 65 6c 69 6e 65 01
		)
		// Method begins at RVA 0x2050
		// Header size: 12
		// Code size: 39 (0x27)
		.maxstack 3
		.locals init (
			[0] int32[],
			[1] int32
		)

		IL_0000: ldc.i4 1000
		IL_0005: newarr [System.Runtime]System.Int32
		IL_000a: stloc.0
		IL_000b: ldc.i4.0
		IL_000c: stloc.1
		IL_000d: br.s IL_0017
		// loop start (head: IL_0017)
			IL_000f: ldloc.0
			IL_0010: ldloc.1
			IL_0011: ldloc.1
			IL_0012: stelem.i4
			IL_0013: ldloc.1
			IL_0014: ldc.i4.1
			IL_0015: add
			IL_0016: stloc.1

			IL_0017: ldloc.1
			IL_0018: ldc.i4 1000
			IL_001d: blt.s IL_000f
		// end loop

		IL_001f: ldloc.0
		IL_0020: ldc.i4 500
		IL_0025: ldelem.i4
		IL_0026: ret
	} // end of method ArrayBenchmarks::ArrayTradicionalHeap

	.method public hidebysig 
		instance int32 ArrayStackAlloc () cil managed 
	{
		.custom instance void [BenchmarkDotNet.Annotations]BenchmarkDotNet.Attributes.BenchmarkAttribute::.ctor(int32, string) = (
			01 00 17 00 00 00 4a 2f 68 6f 6d 65 2f 70 65 64
			72 6f 2f 54 65 78 74 6f 73 2f 43 53 68 61 72 70
			2f 69 6e 6c 69 6e 65 5f 61 72 72 61 79 73 2f 69
			6e 6c 69 6e 65 5f 61 72 72 61 79 73 5f 62 65 6e
			63 68 6d 61 72 6b 2f 50 72 6f 67 72 61 6d 2e 63
			73 00 00
		)
		// Method begins at RVA 0x2084
		// Header size: 12
		// Code size: 59 (0x3b)
		.maxstack 2
		.locals init (
			[0] valuetype [System.Runtime]System.Span`1<int32>,
			[1] int32
		)

		IL_0000: ldc.i4 4000
		IL_0005: conv.u
		IL_0006: localloc
		IL_0008: ldc.i4 1000
		IL_000d: newobj instance void valuetype [System.Runtime]System.Span`1<int32>::.ctor(void*, int32)
		IL_0012: stloc.0
		IL_0013: ldc.i4.0
		IL_0014: stloc.1
		IL_0015: br.s IL_0025
		// loop start (head: IL_0025)
			IL_0017: ldloca.s 0
			IL_0019: ldloc.1
			IL_001a: call instance !0& valuetype [System.Runtime]System.Span`1<int32>::get_Item(int32)
			IL_001f: ldloc.1
			IL_0020: stind.i4
			IL_0021: ldloc.1
			IL_0022: ldc.i4.1
			IL_0023: add
			IL_0024: stloc.1

			IL_0025: ldloc.1
			IL_0026: ldc.i4 1000
			IL_002b: blt.s IL_0017
		// end loop

		IL_002d: ldloca.s 0
		IL_002f: ldc.i4 500
		IL_0034: call instance !0& valuetype [System.Runtime]System.Span`1<int32>::get_Item(int32)
		IL_0039: ldind.i4
		IL_003a: ret
	} // end of method ArrayBenchmarks::ArrayStackAlloc

	.method public hidebysig 
		instance int32 UsoInlineArray () cil managed 
	{
		.custom instance void [BenchmarkDotNet.Annotations]BenchmarkDotNet.Attributes.BenchmarkAttribute::.ctor(int32, string) = (
			01 00 20 00 00 00 4a 2f 68 6f 6d 65 2f 70 65 64
			72 6f 2f 54 65 78 74 6f 73 2f 43 53 68 61 72 70
			2f 69 6e 6c 69 6e 65 5f 61 72 72 61 79 73 2f 69
			6e 6c 69 6e 65 5f 61 72 72 61 79 73 5f 62 65 6e
			63 68 6d 61 72 6b 2f 50 72 6f 67 72 61 6d 2e 63
			73 00 00
		)
		// Method begins at RVA 0x20cc
		// Header size: 12
		// Code size: 61 (0x3d)
		.maxstack 2
		.locals init (
			[0] valuetype MeuArrayFixoGrande,
			[1] int32,
			[2] valuetype [System.Runtime]System.Span`1<int32>
		)

		IL_0000: ldloca.s 0
		IL_0002: initobj MeuArrayFixoGrande
		IL_0008: ldc.i4.0
		IL_0009: stloc.1
		IL_000a: br.s IL_0027
		// loop start (head: IL_0027)
			IL_000c: ldloca.s 0
			IL_000e: ldc.i4 1000
			IL_0013: call valuetype [System.Runtime]System.Span`1<!!1> '<PrivateImplementationDetails>'::InlineArrayAsSpan<valuetype MeuArrayFixoGrande, int32>(!!0&, int32)
			IL_0018: stloc.2
			IL_0019: ldloca.s 2
			IL_001b: ldloc.1
			IL_001c: call instance !0& valuetype [System.Runtime]System.Span`1<int32>::get_Item(int32)
			IL_0021: ldloc.1
			IL_0022: stind.i4
			IL_0023: ldloc.1
			IL_0024: ldc.i4.1
			IL_0025: add
			IL_0026: stloc.1

			IL_0027: ldloc.1
			IL_0028: ldc.i4 1000
			IL_002d: blt.s IL_000c
		// end loop

		IL_002f: ldloca.s 0
		IL_0031: ldc.i4 500
		IL_0036: call !!1& '<PrivateImplementationDetails>'::InlineArrayElementRef<valuetype MeuArrayFixoGrande, int32>(!!0&, int32)
		IL_003b: ldind.i4
		IL_003c: ret
	} // end of method ArrayBenchmarks::UsoInlineArray

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2115
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System.Runtime]System.Object::.ctor()
		IL_0006: ret
	} // end of method ArrayBenchmarks::.ctor

} // end of class ArrayBenchmarks

.class public auto ansi beforefieldinit Program
	extends [System.Runtime]System.Object
{
	// Methods
	.method public hidebysig static 
		void Main (
			string[] args
		) cil managed 
	{
		.custom instance void [System.Runtime]System.Runtime.CompilerServices.NullableContextAttribute::.ctor(uint8) = (
			01 00 01 00 00
		)
		// Method begins at RVA 0x211d
		// Header size: 1
		// Code size: 9 (0x9)
		.maxstack 8
		.entrypoint

		IL_0000: ldnull
		IL_0001: ldnull
		IL_0002: call class [BenchmarkDotNet]BenchmarkDotNet.Reports.Summary [BenchmarkDotNet]BenchmarkDotNet.Running.BenchmarkRunner::Run<class ArrayBenchmarks>(class [BenchmarkDotNet]BenchmarkDotNet.Configs.IConfig, string[])
		IL_0007: pop
		IL_0008: ret
	} // end of method Program::Main

	.method public hidebysig specialname rtspecialname 
		instance void .ctor () cil managed 
	{
		// Method begins at RVA 0x2127
		// Header size: 1
		// Code size: 7 (0x7)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call instance void [System.Runtime]System.Object::.ctor()
		IL_0006: ret
	} // end of method Program::.ctor

} // end of class Program

.class private auto ansi sealed '<PrivateImplementationDetails>'
	extends [System.Runtime]System.Object
{
	.custom instance void [System.Runtime]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (
		01 00 00 00
	)
	// Methods
	.method assembly hidebysig static 
		valuetype [System.Runtime]System.Span`1<!!TElement> InlineArrayAsSpan<TBuffer, TElement> (
			!!TBuffer& buffer,
			int32 length
		) cil managed 
	{
		// Method begins at RVA 0x212f
		// Header size: 1
		// Code size: 13 (0xd)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call !!1& [System.Runtime]System.Runtime.CompilerServices.Unsafe::As<!!TBuffer, !!TElement>(!!0&)
		IL_0006: ldarg.1
		IL_0007: call valuetype [System.Runtime]System.Span`1<!!0> [System.Runtime]System.Runtime.InteropServices.MemoryMarshal::CreateSpan<!!TElement>(!!0&, int32)
		IL_000c: ret
	} // end of method '<PrivateImplementationDetails>'::InlineArrayAsSpan

	.method assembly hidebysig static 
		!!TElement& InlineArrayElementRef<TBuffer, TElement> (
			!!TBuffer& buffer,
			int32 index
		) cil managed 
	{
		// Method begins at RVA 0x213d
		// Header size: 1
		// Code size: 13 (0xd)
		.maxstack 8

		IL_0000: ldarg.0
		IL_0001: call !!1& [System.Runtime]System.Runtime.CompilerServices.Unsafe::As<!!TBuffer, !!TElement>(!!0&)
		IL_0006: ldarg.1
		IL_0007: call !!0& [System.Runtime]System.Runtime.CompilerServices.Unsafe::Add<!!TElement>(!!0&, int32)
		IL_000c: ret
	} // end of method '<PrivateImplementationDetails>'::InlineArrayElementRef

} // end of class <PrivateImplementationDetails>

