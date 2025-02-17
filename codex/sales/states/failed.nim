import ../statemachine
import ./errorhandling
import ./errored

type
  SaleFailed* = ref object of ErrorHandlingState
  SaleFailedError* = object of SaleError

method `$`*(state: SaleFailed): string = "SaleFailed"

method run*(state: SaleFailed, machine: Machine): Future[?State] {.async.} =
  let error = newException(SaleFailedError, "Sale failed")
  return some State(SaleErrored(error: error))
