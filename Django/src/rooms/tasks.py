from celery.decorators import periodic_task, task
from celery.utils.log import get_task_logger

logger = get_task_logger(__name__)


@periodic_task(
    run_every=(crontab(minute='*/60')),
    name="send_automated_alarm",
    ignore_result=True
)
def send_automated_alarm():
    """
    Sends alarm
    """
    logger.info("Sent automatic alarm")



@task(name="send_manual_alarm")
def send_manual_alarm():
    """
    Sends manual alarm
    """
    logger.info("Sent manual alarm")
 
