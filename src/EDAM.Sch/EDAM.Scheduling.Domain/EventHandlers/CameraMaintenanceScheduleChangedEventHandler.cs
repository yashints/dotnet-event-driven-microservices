using MediatR;
using EDAM.Core.Interfaces;
using EDAM.Scheduling.Domain.Events;
using EDAM.Scheduling.Domain.ValueObjects;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Scheduling.Domain.EventHandlers
{
    public class CameraMaintenanceScheduleChangedEventHandler : IDomainEventHandler<CameraMaintenanceScheduleChangedEvent>
    {
        public Task Handle(CameraMaintenanceScheduleChangedEvent notification, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }

    }
}
