let $begin := (doc("src/NASAtemperatureAbnormal.xml")/years)
return <results>
    {
        for $st in $begin/year
        let $year := $st
            for $months in $year[@collectingYear = $year/@collectingYear]
            let $month := $year/months

            let $max := max (for $num in $month//diffTemperature
                where $num != ''
                    return  ($num))

            let $maxMonth :=  for $monthName in $month//diffTemperature/..
            where $monthName//diffTemperature = $max and  $monthName//diffTemperature != ''
            return $monthName

            let $min := min (for $num in $month//diffTemperature
            where $num != ''
            return  ($num))

            let $minMonth :=  for $monthName in $month//diffTemperature/..
            where $monthName//diffTemperature = $min and  $monthName//diffTemperature != ''
            return $monthName

        return  <year collecting="{ $year/@collectingYear}">
             <maxTempInMonth> {$maxMonth} </maxTempInMonth>
             <minTempInMonth> {$minMonth} </minTempInMonth>
        </year>
    }
</results>



(:for $root in (doc("src/NASAtemperatureAbnormal.xml")/years):)
(:return <years>{for $year in $root/year:)
(:let $mElement := $year/months//diffTemperature:)
(:let $max := max(for $num in $mElement:)
(:where $num != '':)
(:return  ($num):)
(:):)
(:let $maxMonth :=  for $mText in $mElement/..:)
(:where $mText/diffTemperature = $max and  $mText/diffTemperature != '':)
(:return $mText:)
(:let $min := min(for $num in $mElement:)
(:where $num != '':)
(:return number($num):)
(:):)
(:let $minMonth := for $mText in $mElement/..:)
(:where $mText/diffTemperature != '' and $mText/diffTemperature = $min:)
(:return $mText:)
(:return <year>{$year/@collectingYear:)
(:,       <maxMonth>     {:)
(:    ($maxMonth):)
(:}</maxMonth>:)
(:, <minMonth>{:)
(:    $minMonth:)
(:}</minMonth>}:)
(:</year>}:)
(:</years>:)

