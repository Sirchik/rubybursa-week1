<!DOCTYPE HTML>
<html lang="en-US">
<head>
  <meta charset="UTF-8">
  <title>Калькулятор</title>
  <style type="text/css">
    .tblCalc{
    border:1px  solid green;
    margin:0;
    padding:0;
    width:250px;
    text-align:center;
  }
  .tblCalc input{
    border:1px solid gray;
    width:30px;
    margin:4px;
  }
  .btnGray input{
    background: gray;
  }
    #btnWide{
    width:80px;
  }
  #editWide{
    width:250px;
  }
  td {
  background-color:green;
  }
  }
</style>
</head>
<body>
<form name="calc" action="">
     <table class="tblCalc" cellpadding=0 cellspacing=0>
     <tr>
         <td colspan=5 align=middle>
          <input id="editWide" name="ReadOut" type="Text"
                size=28 value="0" width="250px">
         </td>
     </tr>
     <tr>
         <td colspan="3"></td>
         <td class = "btnGray"><input name="btnClear" type="Button"
            value="C" onclick="Clear()" /></td>
         <td class = "btnGray"><input name="btnClearEntry" type="Button"
            value="CE" onclick="ClearEntry()" /></td>
     </tr>
     <tr>
         <td><input name="btnSeven" type="Button"
            value="7" onclick="NumPressed(7)"></td>
         <td><input name="btnEight" type="Button"
            value="8" onclick="NumPressed(8)"></td>
         <td><input name="btnNine" type="Button"
            value="9" onclick="NumPressed(9)"></td>
         <td class = "btnGray"><input name="btnPlus" type="Button"
            value="+" onclick="Operation('+')" /></td>
         <td class = "btnGray"><input name="btnMultiply" type="Button"
            value="*" onclick="Operation('*')" /></td>
       </tr>
     <tr>
         <td><input name="btnFour" type="Button"
            value="4" onclick="NumPressed(4)"></td>
         <td><input name="btnFive" type="Button"
            value="5" onclick="NumPressed(5)"></td>
         <td><input name="btnSix" type="Button"
            value="6" onclick="NumPressed(6)"></td>
         <td class = "btnGray"><input name="btnMinus" type="Button"
            value="-" onclick="Operation('-')" /></td>
         <td align=middle class = "btnGray"><input name="btnDivide" type="Button"
            value=" / " onclick="Operation('/')" /></td>
     </tr>
     <tr>
         <td><input name="btnOne" type="Button"
            value="1" onclick="NumPressed(1)"></td>
         <td><input name="btnTwo" type="Button"
            value="2" onclick="NumPressed(2)"></td>
         <td><input name="btnThree" type="Button"
            value="3" onclick="NumPressed(3)"></td>
         <td class = "btnGray"><input name="btnPercent" type="Button"
            value="%" onclick="Percent()" /></td>
         <td class = "btnGray"><input name="btnSqrt" type="Button"
            value="√" onclick="Sqrt()" /></td>
     </tr>

     <tr>
         <td><input name="btnZero" type="Button"
            value="0" onclick="NumPressed(0)"></td>
         <td class = "btnGray"><input name="btnDecimal" type="Button"
            value="." onclick="Decimal()"></td>
         <td class = "btnGray"><input name="btnNeg" type="button"
            value="+/-" onclick="Neg()" /></td>
         <td colspan="2" class = "btnGray"><input id="btnWide" name="btnEquals"
            type="Button" value="=" onclick="Operation('=')"></td>
     </tr>
     </table>
</form>
  <script language="JavaScript">


var Fcalc = document.calc;
var Currents = 0;
var FlagNewNum = false;
var PendingOp = "";


// обработчик нажатия 
// цифровой кнопки
function NumPressed (Num) 
{
    if (FlagNewNum) 
    {
      Fcalc.ReadOut.value = Num;
      FlagNewNum = false;
    } 
    else 
    {
      if (Fcalc.ReadOut.value == "0")
        Fcalc.ReadOut.value = Num;
      else
        Fcalc.ReadOut.value += Num;
    }
}
  
// обработчик нажатия
// кнопки действия
function Operation (Op) 
{
    var Readout = Fcalc.ReadOut.value;
    if (FlagNewNum && PendingOp != "=")
    {
      Fcalc.ReadOut.value = Currents;
    }
    else
    {
      FlagNewNum = true;
      if ( '+' == PendingOp )
        Currents += parseFloat(Readout);
      else if ( '-' == PendingOp )
        Currents -= parseFloat(Readout);
      else if ( '/' == PendingOp )
        Currents /= parseFloat(Readout);
      else if ( '*' == PendingOp )
        Currents *= parseFloat(Readout);
      else
        Currents = parseFloat(Readout);
      Fcalc.ReadOut.value = Currents;
      PendingOp = Op;
    }
}
  
// добавление десятичной точки с числу
function Decimal () 
{
    var curReadOut = Fcalc.ReadOut.value;
    if (FlagNewNum) 
    {
      curReadOut = "0.";
      FlagNewNum = false;
    }
    else
    {
      if (curReadOut.indexOf(".") == -1)
        curReadOut += ".";
    }
    Fcalc.ReadOut.value = curReadOut;
}
  
// Очистка текущего результата
function ClearEntry () 
{
    Fcalc.ReadOut.value = "0";
    FlagNewNum = true;
}
  
// Полная очистка всех результатов
function Clear () 
{
    Currents = 0;
    PendingOp = "";
    ClearEntry();

}



// меняем знак текущего результата
function Neg () 
{
    Fcalc.ReadOut.value = 
    parseFloat(Fcalc.ReadOut.value) * -1;
}
  
// вычисляем значение процентов
function Percent () 
{
    Fcalc.ReadOut.value = 
      (parseFloat(Fcalc.ReadOut.value) / 100) * 
      parseFloat(Currents);
}
function Sqrt () 
{
    Fcalc.ReadOut.value = 
      Math.sqrt(parseFloat(Fcalc.ReadOut.value));
}
</script>
</body>