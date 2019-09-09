let $begin := (doc("src/NASAtemperatureAbnormal.xml")/years)
return <results>
    {
        for $st in $begin/year
        let $year := $st
            for $months in $year[@collectingYear = $year/@collectingYear]
            let $month := $year/months

            let $max := max (for $tempValue in $month//diffTemperature
                where $tempValue != ''
                    return  ($tempValue))

            let $maxMonth :=  for $monthName in $month//diffTemperature/..
            where $monthName//diffTemperature = $max and  $monthName//diffTemperature != ''
            return $monthName

            let $min := min (for $tempValue in $month//diffTemperature
            where $tempValue != ''
            return  ($tempValue))

            let $minMonth :=  for $monthName in $month//diffTemperature/..
            where $monthName//diffTemperature = $min and  $monthName//diffTemperature != ''
            return $monthName

        return  <year collecting="{ $year/@collectingYear}">
             <maxTempInMonth> {$maxMonth} </maxTempInMonth>
             <minTempInMonth> {$minMonth} </minTempInMonth>
        </year>
    }
</results>

