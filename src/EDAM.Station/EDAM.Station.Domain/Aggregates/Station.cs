using EDAM.Core.Interfaces;
using EDAM.Station.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Station.Domain.Aggregates
{
    public class Station : IDomainAggregateRoot
    {
        public StationInfo StationData { get; private set; } = default!;
    }
}
