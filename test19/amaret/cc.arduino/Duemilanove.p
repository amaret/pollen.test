package cc.arduino

from pollen.interfaces import Mcu
from pollen.interfaces import Led
from pollen.interfaces import BugMod


composition Duemilanove {

    export Mcu	
    export Led
    export BugMod
}
