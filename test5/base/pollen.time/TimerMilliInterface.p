package pollen.time

from pollen.interfaces import Handler

protocol TimerMilli {

    start()
    stop()
    bool running()
    
    #host setHandlerH(Handler.handle h)
    setHandlerH(Handler.handle h)
}
