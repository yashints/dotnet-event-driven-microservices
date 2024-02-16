using EDAM.Core.Interfaces;
using EDAM.Scheduling.Domain.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Scheduling.Domain.EventHandlers
{
    public class CameraMaintenanceScheduleRemovedEventHandler : IDomainEventHandler<CameraMaintenanceScheduleRemovedEvent>
    {
        public Task Handle(CameraMaintenanceScheduleRemovedEvent notification, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();

        }
    }
}
