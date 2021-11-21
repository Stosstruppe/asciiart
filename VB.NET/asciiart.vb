' asciiart Visual Basic .NET (mono 4.7)
Module Hoge
    Sub Main()
        Dim i, x, y As Integer
        Dim a, b, t, ca, cb As Single
        Dim s As String

        For y = -12 To 12
            For x = -39 To 39
                ca = x * 0.0458
                cb = y * 0.08333
                a = ca
                b = cb
                s = " "
                For i = 0 To 15
                    t = a * a - b * b + ca
                    b = 2 * a * b + cb
                    a = t
                    If (a * a + b * b) > 4 Then
                        s = Hex(i)
                        Exit For
                    End If
                Next
                Console.Write(s)
            Next
            Console.WriteLine()
        Next
    End Sub
End Module
