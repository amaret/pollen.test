package cc.arduino

from pollen.interfaces import Mcu
from pollen.interfaces import Led


composition Duemilanove {

    export Mcu	
    export Led
}
