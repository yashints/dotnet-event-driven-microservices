using EDAM.Core.Interfaces;
using EDAM.Identification.Domain.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Identification.Domain.EventHandlers
{
    public class PassengerIdentifiedEventHandler : IDomainEventHandler<PassengerIdentifiedEvent>
    {
        public Task Handle(PassengerIdentifiedEvent notification, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
