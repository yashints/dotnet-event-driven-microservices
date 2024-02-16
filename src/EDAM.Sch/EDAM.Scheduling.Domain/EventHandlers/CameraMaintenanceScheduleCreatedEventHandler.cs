using EDAM.Core.Interfaces;
using EDAM.Scheduling.Domain.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Scheduling.Domain.EventHandlers
{
    public class CameraMaintenanceScheduleCreatedEventHandler : IDomainEventHandler<CameraMaintenanceScheduleCreatedEvent>
    {
        public Task Handle(CameraMaintenanceScheduleCreatedEvent notification, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
